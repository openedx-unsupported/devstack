2. Use ``expect`` for CLI testing
=================================

Status
------

Approved

Context
-------

Devstack has a CLI that a large number of developers depend upon, and when it breaks it can cause disruption across multiple teams. However, there is limited automated testing that would prevent such breakage. The CI script is currently set up to run through some common commands for a static set of services, from cloning repositories all the way through provisioning. These can catch some basic problems but only exercise a few core Makefile targets.

Recently the CLI was changed to warn the developer when "bare" commands such as ``make dev.pull`` are run. The new ``make_warn_default_large.sh`` prints a warning and then waits for acknowledgement before proceeding. It was not obvious how to add automated tests for this. Using pytest and Python's ``subprocess`` module turned out to be overly difficult—this type of explicit process management requires a lot of low-level work such as designating the spawned process as a process group leader, killing the group at the end or on error, reading into buffers before the command is finished, matching stderr and stdout against regexes, managing timeouts, etc. The Expect utility handles this using a domain-specific language, and while it is not installed by default on Mac or Linux, it is designed for exactly this sort of task.

It is possible that there's an expect-like wrapper of subprocess that would work from pytest, but we couldn't find one in the time we'd allotted for the task.

Decision
--------

A ``tests`` directory is added with a single Expect script which tests the warn-on-large-set path for one make command. More scripts can be added as other CLI changes are made.

The Github CI configuration installs ``expect`` and runs the Expect script by name.

Consequences
------------

Developers wishing to run the automated tests locally will have to have Expect installed. This should be available on both Mac and Linux.

There is no provision made here for setting up different environments in which to run the tests (e.g. with/without an ``options.local.mk`` overrides file). If this is needed, it can be arranged from a wrapper script.

Rejected Alternatives
---------------------

Manual invocation of ``subprocess``, as described above.
