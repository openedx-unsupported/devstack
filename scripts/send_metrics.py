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
course of running tests so that it does not pollute our main data.
(Extra debugging information will also be printed, including the sent
event data.)

Config file schema:

- 'anonymous_user_id' (string) high-entropy, non-identifying unique user ID
- 'consent' (dict) present when user has either consented or declined
  metrics collection
    - 'decision' (boolean) indicates whether the user has consented or declined
    - 'timestamp' (string) ISO-8601 date-time when the user consented or declined
"""

import base64
import json
import os
import subprocess
import sys
import traceback
import urllib.request as req
import uuid
from datetime import datetime, timedelta, timezone
from http.client import RemoteDisconnected
from os import path
from signal import SIG_DFL, SIGINT, signal
from urllib.error import URLError


test_mode = os.environ.get('DEVSTACK_METRICS_TESTING')

# Provisioned as a separate source particular to devstack
segment_write_key = "MUymmyrKDLk6JVwtkveX6OHVKMhpApou"

config_dir = path.expanduser("~/.config/devstack")
config_path = path.join(config_dir, "metrics.json")


def base64str(s):
    """Encode a string in Base64, returning a string."""
    return base64.b64encode(s.encode()).decode()


def check_consent():
    """
    Check if it's OK to send metrics, returning dict of:

    - 'ok_to_collect' (boolean) True when metrics may be collected
    - 'config' (dict) config data, present if `ok_to_collect` is True
    - 'print_invitation' (boolean) True when an invitation to consent to
      metrics collection should be printed for the user

    May throw an exception if config file cannot be parsed.
    """
    try:
        with open(config_path, 'r') as f:
            config = json.loads(f.read())
    except FileNotFoundError:
        return {'ok_to_collect': False, 'print_invitation': True}

    decision = config.get('consent', {}).get('decision')

    # Explicit decline.
    if decision is False:
        return {'ok_to_collect': False, 'print_invitation': False}

    # Anything other than consent: Just invite. (If they haven't
    # declined *or* consented, either they've not made a decision
    # (value is None) or there's some invalid value that will be
    # cleared out by the opt-in/out process.)
    if decision is not True:
        return {'ok_to_collect': False, 'print_invitation': True}

    # At this point, we know they've consented, but one last check...

    # Opt-in process should have set an anonymous user ID, which is
    # required for sending events.
    if not config.get('anonymous_user_id'):
        # Something's wrong with the config file if they've consented
        # but not been assigned an ID, so just pretend they've not
        # consented -- opting in should reset things.
        return {'ok_to_collect': False, 'print_invitation': True}

    # Consented, so no need to invite.
    return {
        'ok_to_collect': True,
        'config': config,
        'print_invitation': False
    }


def send_metrics_to_segment(event_type, event_properties, config):
    """
    Send collected metrics to Segment.

    May throw.
    """
    # Get a shallow copy of the input and annotate it as a non-test
    # event unless overridden by environment variable.
    event_properties = event_properties.copy()
    event_properties['is_test'] = test_mode or 'no'

    event = {
        'event': event_type,
        'userId': config['anonymous_user_id'],
        'properties': event_properties,
        'sentAt': datetime.now(timezone.utc).isoformat(),
    }

    if test_mode:
        print("Send metrics info: %s" % json.dumps(event), file=sys.stderr)

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
    except (RemoteDisconnected, URLError):
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

    Return exit code of process (negative for signals).
    """
    # Do as much as possible inside try blocks
    do_collect = True
    try:
        start_time = datetime.now(timezone.utc)

        # Catch SIGINT (but only once) so that we can report an event
        # when the developer uses Ctrl-C to kill the make command
        # (which would normally kill this process as well).  This
        # handler just ignores the signal and then unregisters itself.
        #
        # There is no guarantee of whether this signal will be caught
        # first or the child process will exit first. This could
        # theoretically result in unregistering the signal handler
        # before the signal has occurred, resulting in failure to
        # report the event, but there's no way to prevent this.
        signal(SIGINT, lambda _signum, _frame: signal(SIGINT, SIG_DFL))
    except:
        do_collect = False
        traceback.print_exc()
        print("Metrics collection setup failed. "
              "If this keeps happening, please let the Architecture team know. "
              "(This should not affect the outcome of your make command.)",
              file=sys.stderr)

    completed_process = run_target(make_target)
    subprocess_exit_code = completed_process.returncode

    # Do as much as possible inside try blocks
    try:
        # Skip metrics reporting if setup failed
        if not do_collect:
            return subprocess_exit_code

        signal(SIGINT, SIG_DFL)  # stop trapping SIGINT (if haven't already)
        end_time = datetime.now(timezone.utc)
        time_diff_millis = (end_time - start_time) // timedelta(milliseconds=1)
        # Must be compatible with our Segment schema, and must not be
        # expanded to include additional attributes without an
        # additional consent check.
        event_properties = {
            'command_type': 'make',
            'command': make_target[:50],  # limit in case of mis-pastes at terminal
            'start_time': start_time.isoformat(),
            'duration_ms': time_diff_millis,
            # If the subprocess was interrupted by a signal, the exit
            # code will be negative signal value (e.g. -2 for SIGINT,
            # rather than the 130 it returns from the shell):
            # https://docs.python.org/3.8/library/subprocess.html#subprocess.CompletedProcess
            #
            # If a make subprocess exits non-zero, make exits with code 2.
            'exit_status': subprocess_exit_code,
            **read_git_state()
        }
        send_metrics_to_segment('devstack.command.run', event_properties, config)
    except:
        # We don't want to warn about transient Segment outages or
        # similar, but there might be a coding error in the
        # send-metrics script.
        traceback.print_exc()
        print("Failed to send devstack metrics to Segment. "
              "If this keeps happening, please let the Architecture team know. "
              "(This should not have affected the outcome of your make command.)",
              file=sys.stderr)

    return subprocess_exit_code


def run_target(make_target):
    """
    Just run make on the given target.

    Return exit code of process (negative for signals).
    """
    return subprocess.run(["make", "impl-%s" % make_target], check=False)


def do_wrap(make_target):
    """
    Run the given make target, and collect and report data if and only if
    the user has consented to data collection.

    Return exit code to exit with (signals become 128 + signal value).
    """
    try:
        consent_state = check_consent()
    except Exception as e:  # don't let errors interrupt dev's work
        if test_mode:
            print("Metrics disabled due to startup error: %r" % e)
        consent_state = {}

    if consent_state.get('ok_to_collect'):
        subprocess_exit_code = run_wrapped(make_target, consent_state.get('config'))
    else:
        subprocess_exit_code = run_target(make_target).returncode
        if consent_state.get('print_invitation'):
            print(
                "Would you like to assist devstack development by sending "
                "anonymous usage metrics to edX? Run `make metrics-opt-in` "
                "to learn more!",
                file=sys.stderr
            )

    if subprocess_exit_code < 0:
        # Translate to shell convention.
        return 128 + -subprocess_exit_code
    else:
        return subprocess_exit_code


def do_opt_in():
    """
    Perform the interactive opt-in process.
    """
    start_time = datetime.now(timezone.utc)
    try:
        with open(config_path, 'r') as f:
            config = json.loads(f.read())
    except FileNotFoundError:
        config = {}

    # Only short-circuit here if consented *and* all necessary info present.
    if config.get('consent', {}).get('decision') and config.get('anonymous_user_id'):
        print(
            "It appears you've previously opted-in to metrics reporting. "
            "Recorded consent: {record!r}"
            .format(record=config['consent'])
        )
        return
    # variables used to bold relevant text in the consent language below
    MARKUP_BOLD = '\033[1m'
    MARKUP_END = '\033[0m'

    # NOTE: This is required for informed consent on the part of the users opting-in.
    # The types of data collected cannot be expanded or changed without legal review.
    print(
        "\n"
        + MARKUP_BOLD + "Allow devstack to report anonymized usage metrics?\n"  + MARKUP_END +
        "\n"
        "This will report usage information to edX so that devstack improvements can be planned and evaluated. "
        "The metrics and attributes to be collected by edX include an anonymous user ID and information about devstack command calls (e.g. make targets, exit codes, and command durations), "
        "the OS, and git repo state."
        "\n\n"
        + MARKUP_BOLD + "Type 'yes' or 'y' to opt in to reporting this information, or anything else to cancel. " + MARKUP_END +
        "\n\n"
        "You may withdraw this permission and stop sending such metrics at any time by running ‘make metrics-opt-out’."
    )
    answer = input()
    print()

    if answer.lower() in ['yes', 'y']:
        config['consent'] = {
            'decision': True,
            'timestamp': datetime.now(timezone.utc).isoformat()
        }
        # Set an anonymous user ID on first opt-in, but preserve it if
        # they're toggling back and forth.
        config['anonymous_user_id'] = config.get('anonymous_user_id') or str(uuid.uuid4())

        os.makedirs(config_dir, exist_ok=True)
        with open(config_path, 'w') as f:
            f.write(json.dumps(config))

        print(
            "Thank you for contributing to devstack development! "
            "Your opt-in has been stored in {config_path} and "
            "you can opt out again at any time with `make metrics-opt-out`."
            .format(config_path=config_path)
        )
        # Send record of opt-in so we can tell whether people are
        # opting in even if they're not running any of the
        # instrumented commands.
        event_properties = {
            'command_type': 'make',
            'command': 'metrics-opt-in',
            'choice': 'accept',
            # Note: Not quite the same as the time they accepted
            # (could have left prompt open for a while).
            'start_time': start_time.isoformat(),
            # This tells us what version of the consent check was
            # presented to the user.
            **read_git_state()
        }
        send_metrics_to_segment('devstack.command.run', event_properties, config)
    else:
        print("Cancelled opt-in.")


def do_opt_out():
    """
    Opt the user out.
    """
    start_time = datetime.now(timezone.utc)

    os.makedirs(config_dir, exist_ok=True)
    try:
        with open(config_path, 'r') as f:
            config = json.loads(f.read())
    except FileNotFoundError:
        config = {}

    had_consented = config.get('consent', {}).get('decision') is True

    config['consent'] = {
        'decision': False,
        'timestamp': datetime.now(timezone.utc).isoformat()
    }
    with open(config_path, 'w') as f:
        f.write(json.dumps(config))

    print(
        "You have been opted out of reporting devstack command metrics to edX. "
        "No further usage metrics will be sent. "
        "This preference is stored in a config file located at {config_path}; "
        "you can opt back in by running `make metrics-opt-in` at any time."
        .format(config_path=config_path)
    )

    # Only send an event when someone had previously consented -- this
    # allows us to keep a record of the start and end of their
    # consent.
    if had_consented:
        # Collect as little information as possible for this event
        event_properties = {
            'command_type': 'make',
            'command': 'metrics-opt-out',
            'previous_consent': 'yes',
            'start_time': start_time.isoformat()
        }
        send_metrics_to_segment('devstack.command.run', event_properties, config)


def main(args):
    if len(args) == 0:
        print(
            "Usage:\n"
            "  send_metrics.py wrap <make-target>\n"
            "  send_metrics.py opt-in\n"
            "  send_metrics.py opt-out",
            file=sys.stderr
        )
        sys.exit(1)
    action = args[0]
    action_args = args[1:]

    # Dispatch
    if action == 'wrap':
        if len(action_args) != 1:
            print("send-metrics wrap takes one argument", file=sys.stderr)
            sys.exit(1)
        conveyed_exit_code = do_wrap(action_args[0])
        sys.exit(conveyed_exit_code)
    elif action == 'opt-in':
        if len(action_args) != 0:
            print("send-metrics opt-in takes zero arguments", file=sys.stderr)
            sys.exit(1)
        do_opt_in()
    elif action == 'opt-out':
        if len(action_args) != 0:
            print("send-metrics opt-out takes zero arguments", file=sys.stderr)
            sys.exit(1)
        do_opt_out()
    else:
        print("Unrecognized action: %s" % action, file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main(sys.argv[1:])
