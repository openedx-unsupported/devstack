3. Collect usage metrics
========================

Status
------

Approved

Context
-------

Developer velocity can be significantly impacted by the development environment, but without a way to measure impact, it is difficult to tell if education initiatives, documentation, new capabilities, and other changes are having a positive effect on the developer experience. The Arch-BOM team has aready used surveys to get qualitative information about developer experience, but this self-reported information is "expensive" to get—people will only answer so many surveys before survey fatigue sets in.  Quantitative information about tool usage patterns, failure rates, and other higher-frequency, mechanically collectible information would complement the more infrequent, qualitative reports.

We believe that a framework for measuring the usage and time of essential devstack actions will give Arch-BOM more ongoing useful information of developer needs and trends over time in order to prioritize further devstack efforts.


Decision
--------

A number of high-use Makefile targets have been instrumented with metrics collection using an indirection technique. As an example, the target ``dev.provision.%`` now consists only of the command ``@scripts/send_metrics.py wrap "dev.provision.$*"``; the metrics script then calls ``make impl-dev.provision.%``, which is the "real" target. About 6 families of commands have been instrumented in this way.

This ``send_metrics.py`` wrapper script calls Make as a child process, and if consent has been provided, the wrapper additionally collects command duration, exit code, make target, and some environmental information about git.

If a consent decision has not been made, the wrapper script asks the developer (at the end of a command run) to opt in or out. The resulting explicit consent or decline is recorded via a config file, and an anonymous user ID is stored in this config file on first collection if consent is provided.

Metrics are reported synchronously to Segment, then forwarded on to New Relic for analysis. There's a retention period on the data of a year.


Consequences
------------

The current implementation only instruments Makefile targets. The most basic interactions with devstack occur via the Make interface, with additional interaction occurring inside of various Docker shell environments. Most of devstack's command documentation covers Make commands, so this seems like a good first step. It's difficult to capture arbitrary commands, and there are privacy issues there as well, so for now we're just capturing Make targets.

Since devstack is used by both employees and contractors and also the wider Open edX community, it's not sufficient to simply start collecting and reporting metrics; there needs to be informed consent. This limits the amount of participation, even of edX employees. (We don't have a way of telling whether a developer is an employee.)

Commands run while not connected to the internet, or by people who have Segment blocked at the DNS level, will not have metrics captured.


Rejected Alternatives
---------------------

The explicit indirection technique is bulky and makes it harder to maintain the Makefile. However, all of the other techniques we considered have serious downsides:

- Adding a command call at the beginning of each target's block would add almost as much "chaff", and would not capture timings or exit codes, nor target dependency timings and failures.
- Overriding the ``SHELL`` variable with a wrapper script would allow capturing some timings and exit codes, but only per-line, not per-target. Using ``.ONESHELL`` would solve this, except then the make target itself can't be captured without parsing the process tree—and this has only been tested on Linux, not Mac.
- Asking people to call ``./make.sh`` instead of ``make`` would allow full capturing, but lose tab-completion, and it is likely very few people would change their workflows to accommodate this request.
- Installing a package into the devstack virtualenv which declares a ``console_scripts`` override named ``make`` would allow intercepting make (and other) commands, but would only work for people who interact with devstack from a virtualenv, which turns out to be a minority of edX developers according to a poll.

We'll continue looking for a low-profile way to instrument all targets, or change which targets we instrument over time.
