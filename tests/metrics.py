import json
import os
import pexpect
import pytest
from contextlib import contextmanager


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
        
    config_dir = os.path.expanduser('~/.config/devstack')
    config_path = os.path.join(config_dir, 'metrics.json')

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
        with open(config_path, 'r') as f:
            # For debugging...
            print("Metrics config file in effect was: " + f.read())

        os.remove(config_path)


def test_metrics():
    """
    Test that dev.up.% is instrumented for metrics collection.
    """
    with environment_as({'collection_enabled': True}):
        p = pexpect.spawn('make dev.up.redis', timeout=60)
        p.expect(r'Send metrics info:')
        p.expect(r'dev\.up\.redis')
