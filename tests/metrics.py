import json
import os
import pexpect
import pytest


def test_metrics():
    """
    Test that dev.up.% is instrumented for metrics collection.
    """

    # Some setup and preconditions first...

    assert os.environ.get('DEVSTACK_METRICS_TESTING'), \
        "You need a DEVSTACK_METRICS_TESTING=debug if running this test " \
        "locally since this environment variable both enables printing of " \
        "metrics and also marks sent metric events as test data."
        
    config_dir = os.path.expanduser('~/.config/devstack')
    config_path = os.path.join(config_dir, 'metrics.json')

    assert not os.path.isfile(config_path), \
        "You already have a config file; failing now to avoid overwriting it."

    # Enable feature switch for CI tests
    os.makedirs(config_dir, exist_ok=True)
    with open(config_path, 'w') as f:
        f.write(json.dumps({'collection_enabled': True}))

    # OK, the actual test:

    try:
        p = pexpect.spawn('make dev.up.redis', timeout=60)
        p.expect(r'Send metrics info:')
        p.expect(r'dev\.up\.redis')
    finally:
        # Clean up before exiting.
        with open(config_path, 'r') as f:
            # For debugging...
            print("Metrics config file in effect was: " + f.read())

        os.remove(config_path)
