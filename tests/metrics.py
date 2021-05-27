"""
Tests for send-metrics.py
"""

import json
import os
import re
from contextlib import contextmanager

import pexpect
from pexpect import EOF


#### Utilities

# A substring to identify whether an invitation has been made
invitation = 'Would you like to assist devstack development'

config_dir = os.path.expanduser('~/.config/devstack')
config_path = os.path.join(config_dir, 'metrics.json')

@contextmanager
def environment_as(config_data):
    """
    Context manager: Set up environment for metrics testing, or fail if there's
    something wrong in the environment which can't be fixed.

    If `config_data` is not None, write it as JSON to the config file and
    remove it again after the wrapped code runs.
    """
    assert os.environ.get('DEVSTACK_METRICS_TESTING'), \
        "You need a DEVSTACK_METRICS_TESTING=debug if running this test " \
        "locally since this environment variable both enables printing of " \
        "metrics and also marks sent metric events as test data."

    assert not os.path.isfile(config_path), \
        "You already have a config file; failing now to avoid overwriting it."

    if config_data is not None:
        os.makedirs(config_dir, exist_ok=True)
        with open(config_path, 'w') as f:
            f.write(json.dumps(config_data))

    try:
        yield
    finally:
        # Clean up before exiting.
        if config_data is not None:
            with open(config_path, 'r') as f:
                # For debugging...
                print("Metrics config file in effect was: " + f.read())

        try:
            os.remove(config_path)
        except FileNotFoundError:
            pass


def do_opt_in():
    """Opt in (without assertions)."""
    p = pexpect.spawn('make metrics-opt-in', timeout=10)
    p.expect("Type 'yes' or 'y'")
    p.sendline('yes')
    p.expect(EOF)


def assert_consent(status=True):
    """
    Assert consent status in config file. status=True will check for consent
    with timestamp, False will check for a decline with timestamp, and None
    will check that the consent dict is missing.
    """
    with open(config_path, 'r') as f:
        config = json.loads(f.read())
        if status is None:
            assert 'consent' not in config
        else:
            assert isinstance(status, bool)
            consent = config['consent']
            assert consent.get('decision') == status
            # Timestamp should be a date at least (likely also has a time)
            assert re.match(r'^[0-9]{4}-[0-9]{2}-[0-9]{2}', consent.get('timestamp'))


#### Opting in and out

def test_initial_opt_in_accept():
    """
    Test that a consent check is provided, and what happens on accept.
    """
    with environment_as({'collection_enabled': True}):
        p = pexpect.spawn('make metrics-opt-in', timeout=10)
        p.expect_exact("Allow devstack to report anonymized usage metrics?")
        p.expect("Type 'yes' or 'y'")
        p.sendline("yes")
        p.expect("metrics-opt-out")  # prints instructions for opt-out
        # Check that a metric is sent for opt-in
        p.expect("Send metrics info:")
        p.expect(EOF)
        metrics_json = p.before.decode()

        data = json.loads(metrics_json)
        # These keys are defined by a central document; do not send
        # additional metrics without specifying them there first:
        #
        # https://openedx.atlassian.net/wiki/spaces/AC/pages/2720432206/Devstack+Metrics
        #
        # Additional metrics require approval (as do changes to
        # existing ones). Changes to metrics also require an update to the
        # list of metrics displayed during opt-in.
        assert sorted(data.keys()) == ['event', 'properties', 'sentAt', 'userId'], \
            "Unrecognized key in envelope -- confirm that this addition is authorized."
        assert sorted(data['properties'].keys()) == [
            'choice', 'command', 'command_type',
            'git_checked_out_master', 'git_commit_time',
            'is_test', 'start_time',
        ], "Unrecognized attribute -- confirm that this addition is authorized."

        assert data['event'] == 'devstack.command.run'
        assert data['properties']['command_type'] == 'make'
        assert data['properties']['command'] == 'metrics-opt-in'
        assert data['properties']['choice'] == 'accept'

        assert_consent(True)


def test_initial_opt_in_decline():
    """
    Test that a consent check is provided, and what happens on decline.
    """
    with environment_as({'collection_enabled': True}):
        p = pexpect.spawn('make metrics-opt-in', timeout=10)
        p.sendline("")  # empty response
        p.expect(EOF)

        assert 'Send metrics info:' not in p.before.decode()
        # No consent info stored on decline
        assert_consent(None)


def test_initial_opt_out():
    """
    Test that opt-out always marks consent=False (even without collection=enabled).
    """
    with environment_as(None):
        p = pexpect.spawn('make metrics-opt-out', timeout=10)
        p.expect('metrics-opt-in')  # indicates how to undo
        p.expect(EOF)

        assert 'Send metrics info:' not in p.before.decode()
        assert_consent(False)


def test_later_opt_out():
    """
    Test that opt-out after previously opting in sends an event.
    """
    with environment_as({'collection_enabled': True}):
        do_opt_in()
        p = pexpect.spawn('make metrics-opt-out', timeout=10)
        p.expect('metrics-opt-in')
        p.expect(r'Send metrics info:')
        p.expect(EOF)
        metrics_json = p.before.decode()

        data = json.loads(metrics_json)
        # These keys are defined by a central document; do not send
        # additional metrics without specifying them there first:
        #
        # https://openedx.atlassian.net/wiki/spaces/AC/pages/2720432206/Devstack+Metrics
        #
        # Additional metrics require approval (as do changes to
        # existing ones).
        assert sorted(data.keys()) == ['event', 'properties', 'sentAt', 'userId'], \
            "Unrecognized key in envelope -- confirm that this addition is authorized."
        assert sorted(data['properties'].keys()) == [
            'command', 'command_type', 'is_test', 'previous_consent', 'start_time',
        ], "Unrecognized attribute -- confirm that this addition is authorized."

        assert data['event'] == 'devstack.command.run'
        assert data['properties']['command_type'] == 'make'
        assert data['properties']['command'] == 'metrics-opt-out'
        assert data['properties']['previous_consent'] == 'yes'

        assert_consent(False)


#### Collection, or not, for an instrumented make target

def test_feature_flag_missing():
    """
    Test that metrics collection does not happen with feature flag missing.
    """
    with environment_as(None):
        p = pexpect.spawn('make dev.up.redis', timeout=60)
        p.expect(EOF)
        assert 'Send metrics info:' not in p.before.decode()
        assert invitation not in p.before.decode()


def test_feature_flag_false():
    """
    Test that metrics collection does not happen with feature flag set to False.
    """
    with environment_as({'collection_enabled': False}):
        p = pexpect.spawn('make dev.up.redis', timeout=60)
        p.expect(EOF)
        assert 'Send metrics info:' not in p.before.decode()
        assert invitation not in p.before.decode()


def test_enabled_but_no_consent():
    """
    Test that consent still required even with feature flag enabled,
    but an invitation is printed.
    """
    with environment_as({'collection_enabled': True}):
        # no opt-in first
        p = pexpect.spawn('make dev.up.redis', timeout=60)
        p.expect(EOF)
        assert 'Send metrics info:' not in p.before.decode()
        assert invitation in p.before.decode()


def test_no_arbitrary_target_instrumented():
    """
    Test that arbitrary make targets are not instrumented.
    """
    with environment_as({'collection_enabled': True}):
        do_opt_in()
        p = pexpect.spawn('make xxxxx', timeout=60)
        p.expect(EOF)
        assert 'Send metrics info:' not in p.before.decode()
        assert invitation not in p.before.decode()


def test_metrics():
    """
    Test that dev.up.% is instrumented for metrics collection.
    """
    with environment_as({'collection_enabled': True}):
        do_opt_in()
        p = pexpect.spawn('make dev.up.redis', timeout=60)
        p.expect(r'Send metrics info:')
        assert invitation not in p.before.decode()
        p.expect(EOF)
        assert invitation not in p.before.decode()
        metrics_json = p.before.decode()

        data = json.loads(metrics_json)
        # These keys are defined by a central document; do not send
        # additional metrics without specifying them there first:
        #
        # https://openedx.atlassian.net/wiki/spaces/AC/pages/2720432206/Devstack+Metrics
        #
        # Additional metrics require approval (as do changes to
        # existing ones).
        assert sorted(data.keys()) == ['event', 'properties', 'sentAt', 'userId'], \
            "Unrecognized key in envelope -- confirm that this addition is authorized."
        assert sorted(data['properties'].keys()) == [
            'command', 'command_type', 'duration', 'exit_status',
            'git_checked_out_master', 'git_commit_time',
            'is_test', 'start_time',
        ], "Unrecognized attribute -- confirm that this addition is authorized."

        assert data['event'] == 'devstack.command.run'
        assert data['properties']['command'] == 'dev.up.redis'
        # Any string but 'no', really (will match env var in practice)
        assert data['properties']['is_test'] in ['ci', 'debug']


def test_handle_ctrl_c():
    """
    Test that wrapper can survive and report on a Ctrl-C.
    """
    with environment_as({'collection_enabled': True}):
        do_opt_in()
        p = pexpect.spawn('make dev.pull', timeout=60)
        # Make sure wrapped command has started before we interrupt,
        # otherwise signal handler won't even have been registered
        # yet.
        p.expect(b'Are you sure you want to run this command')
        p.send(b'\x03')  # send Ctrl-C to process group
        p.expect(r'Send metrics info:')
        p.expect(r'make: [^\r\n]+ Interrupt')
        metrics_json = p.before.decode()
        p.expect(EOF)
        # confirm docker has stopped
        assert 'Pulling ' not in p.before.decode()

        data = json.loads(metrics_json)

        # Exit status is negative of signal's value (SIGINT = 2)
        assert data['properties']['exit_status'] == -2
