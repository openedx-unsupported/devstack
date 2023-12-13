"""
Tests for make_warn_default_large.sh
"""

import pexpect


def test_warn_default():
    """
    Test that dev.pull (bare) prompts before continuing.
    """

    p = pexpect.spawn('make dev.pull', timeout=15)
    p.expect(r'Are you sure you want to run this command')

    p.sendline('')
    p.expect(r'docker compose pull --include-deps')

    # Send ^C, don't wait for it to finish
    p.sendintr()
