#!/usr/bin/env python3
"""
Python script to collect metrics on devstack make targets.

If the devstack user has consented to metrics collected, this script
calls the specified make target and records metrics about the target,
execution time, and other attributes that can be used to monitor the
usability of devstack. For more information:

https://openedx.atlassian.net/wiki/spaces/AC/pages/2720432206/Devstack+Metrics

If environment variable ``DEVSTACK_METRICS_TESTING`` is present and non-empty, then
metrics will be annotated to indicate that the event occurred in the
course of running tests so that it does not pollute our main data. (TODO)
(Extra debugging information will also be printed, including the sent
event data.)
"""

import base64
import json
import os
import subprocess
import sys
import traceback
import urllib.request as req
import uuid
from datetime import datetime, timezone
from http.client import RemoteDisconnected
from os import path
from signal import SIG_DFL, SIGINT, signal
from urllib.error import URLError


test_mode = os.environ.get('DEVSTACK_METRICS_TESTING')

# Provisioned as a separate source particular to devstack
segment_write_key = "MUymmyrKDLk6JVwtkveX6OHVKMhpApou"


def base64str(s):
    """Encode a string in Base64, returning a string."""
    return base64.b64encode(s.encode()).decode()


def prep_for_send():
    """
    Prepare for sending to Segment, returning config object.

    If successful, indicates that the user has opted in to metrics collection
    and the returned config object will contain:

    - 'anonymous_user_id', a string

    Failure may take the form of an exception or returning None.
    """
    config_path = path.expanduser("~/.config/devstack/metrics.json")
    with open(config_path, 'r') as f:
        config = json.loads(f.read())

    # Currently serving in place of a consent check -- gate on
    # presence of this manually configured setting so that people
    # developing this script can test it.
    #
    # .. toggle_name: collection_enabled
    # .. toggle_implementation: custom
    # .. toggle_default: False
    # .. toggle_description: Allow metrics opt-in (and show invitation to do so)
    #   when running make targets which have been instrumented to call this
    #   script.
    # .. toggle_warnings: This must not be removed or defaulted to True without
    #   approval from a team which has received instructions from Legal on what
    #   data protections are acceptable.
    # .. toggle_use_cases: temporary
    # .. toggle_creation_date: 2021-05-11
    # .. toggle_target_removal_date: 2021-07-01
    # .. toggle_tickets: https://openedx.atlassian.net/browse/ARCHBOM-1788 (edX internal)
    if not config.get('collection_enabled'):
        return None

    # Set user ID on first run
    if 'anonymous_user_id' not in config:
        config['anonymous_user_id'] = str(uuid.uuid4())
        with open(config_path, 'w') as f:
            f.write(json.dumps(config))

    return config


def send_metrics_to_segment(event_properties, config):
    """
    Send collected metrics to Segment.

    May throw.
    """
    # Get a shallow copy of the input and annotate it as a non-test
    # event unless overridden by environment variable.
    event_properties = event_properties.copy()
    event_properties['is_test'] = test_mode or 'no'

    event = {
        'event': 'devstack.command.run',
        'userId': config['anonymous_user_id'],
        'properties': event_properties,
        'sentAt': datetime.now(timezone.utc).isoformat(),
    }

    if test_mode:
        print(f"Send metrics info: {json.dumps(event)}", file=sys.stderr)

    # https://segment.com/docs/connections/sources/catalog/libraries/server/http-api/
    headers = {
        'Authorization': 'Basic ' + base64str(segment_write_key + ':'),
        'Content-Type': 'application/json',
        'User-Agent': 'edx-devstack-send-metrics',
    }
    request = req.Request(
        url = 'https://api.segment.io/v1/track',
        method = 'POST',
        headers = headers,
        data = json.dumps(event).encode(),
    )

    try:
        with req.urlopen(request, timeout=8) as resp:
            status_code = resp.getcode()
            if status_code != 200 and test_mode:
                print("Segment metrics send returned an unexpected status code ${status_code}", file=sys.stderr)
    # Might just be a Segment outage; user probably doesn't care.
    # Other errors can bubble up to a layer that might report them.
    except (RemoteDisconnected, URLError) as e:
        if test_mode:
            traceback.print_exc()


def read_git_state():
    """
    Return additional, git-related attributes to be merged into event
    properties.
    """
    # %cI gets the committer timestamp, rather than the author
    # timestamp; the latter could be older when commits have been
    # rewritten, and the former is more likely to be of interest when
    # looking at repo checkout age.
    process = subprocess.run(
        ['git', 'show', '--no-patch', '--pretty=format:%cI|%D'],
        capture_output=True, check=True, timeout=5
    )
    timestamp, reflist = process.stdout.decode().split('|', 2)
    # Returns true if master is currently checked out. Returns false
    # otherwise, which includes the following situations that are similar
    # to, but different from a master checkout:
    #
    # - Detached-head state which happens to be on same commit as master
    # - Another branch is checked out but points to the same commit as
    #   master
    # - On commit which *used to* be the tip of master, but is no longer
    #   (and is just in master's history)
    is_at_master = "HEAD -> master" in reflist.split(', ')
    return {
        'git_commit_time': timestamp,
        'git_checked_out_master': is_at_master,
    }


def run_wrapped(make_target, config):
    """
    Runs specified make shell target and collects performance data.
    """
    # Do as much as possible inside try blocks
    do_collect = True
    try:
        start_time = datetime.now(timezone.utc)

        # Catch SIGINT (but only once) so that we can report an event
        # when the developer uses Ctrl-C to kill the make command
        # (which would normally kill this process as well).  This
        # handler just ignores the signal and then unregisters itself.
        signal(SIGINT, lambda _signum, _frame: signal(SIGINT, SIG_DFL))
    except:
        do_collect = False
        traceback.print_exc()
        print("Metrics collection setup failed. "
              "If this keeps happening, please let the Architecture team know. "
              "(This should not affect the outcome of your make command.)",
              file=sys.stderr)

    completed_process = run_target(make_target)

    # Do as much as possible inside try blocks
    try:
        # Skip metrics reporting if setup failed
        if not do_collect:
            return

        signal(SIGINT, SIG_DFL)  # stop trapping SIGINT (if haven't already)
        end_time = datetime.now(timezone.utc)
        exit_code = completed_process.returncode
        time_diff_millis = (end_time - start_time).microseconds // 1000
        # Must be compatible with our Segment schema
        event_properties = {
            'command_type': 'make',
            'command': make_target[:50],  # limit in case of mis-pastes at terminal
            'start_time': start_time.isoformat(),
            'duration': time_diff_millis,
            # If the subprocess was interrupted by a signal, the exit
            # code will be negative signal value (e.g. -2 for SIGINT,
            # rather than the 130 it returns from the shell):
            # https://docs.python.org/3.8/library/subprocess.html#subprocess.CompletedProcess
            #
            # If a make subprocess exits non-zero, make exits with code 2.
            'exit_status': exit_code,
            **read_git_state()
        }
        send_metrics_to_segment(event_properties, config)
    except:
        # We don't want to warn about transient Segment outages or
        # similar, but there might be a coding error in the
        # send-metrics script.
        traceback.print_exc()
        print("Failed to send devstack metrics to Segment. "
              "If this keeps happening, please let the Architecture team know. "
              "(This should not have affected the outcome of your make command.)",
              file=sys.stderr)


def run_target(make_target):
    """Just run make on the given target."""
    return subprocess.run(["make", f"impl-{make_target}"])


def main(args):
    if len(args) != 1:
        print("Usage: send-metrics.py <make-target>", file=sys.stderr)
        exit(1)
    make_target = args[0]

    # Collect and report data only if user has consented to data collection
    try:
        consented_config = prep_for_send()
    except Exception as e:  # don't let errors interrupt dev's work
        if test_mode:
            print(f"Metrics disabled due to startup error: {e!r}")
        consented_config = None

    if consented_config:
        run_wrapped(make_target, consented_config)
    else:
        run_target(make_target)


if __name__ == "__main__":
    main(sys.argv[1:])
