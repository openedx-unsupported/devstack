Devstack CLI tests
==================

These tests rely heavily on the pexpect library (inspired by TCL
Expect); if you're editing or creating tests it is highly recommended
you read up on the gotchas in here:

https://pexpect.readthedocs.io/en/stable/overview.html

Debugging tips
--------------

If an expectation fails (or an unexpected timeout or EOF occurs) then pexpect will throw an exception which contains a printout of the internal state of the pexpect instance. This includes the ``buffer``, ``before``, and ``after`` buffers, which are essential for seeing what the child process's output was.

However, pexpect truncates two of these to 100 characters by default. To see more, set the undocumented ``str_last_chars`` attribute on the pexpect object to something larger, or to 0 for the full output.
