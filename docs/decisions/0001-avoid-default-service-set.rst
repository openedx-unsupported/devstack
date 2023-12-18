1. Avoid default service set
============================

Status
------

Approved

Context
-------

Commands like ``make dev.pull`` and ``make dev.up`` operate by default on a large subset of the services that devstack supports (via overridable variable ``DEFAULT_SERVICES``). There are also variants such as ``make dev.up.cms+credentials`` which will operate on a more constrained subset. However, many developers are not aware of these variants or are not in the habit of using them. By not constraining the command to selected services, developers pull down Docker images that they do not need for their current workflow, or find that devstack is using more memory and CPU than needed due to running unnecessary services. These issues have been repeatedly observed in supporting fellow edX devs in internal communications, and are likely an issue in the community as well. We also see people run into bugs in unrelated services, distracting them from their main task.

Several people and teams have made efforts to improve the documentation and offer these better-scoped commands, but we still see complaints about memory, CPU, and network usage that can be solved by avoiding the default set.

The term "default" is also too prescriptive, since it usually connotes a desirable path and we actually don't want people to use this default. The contents of ``DEFAULT_SERVICES`` is also incoherent, as it does not reflect any one workflow, but rather is simply a "large set" that covers something like 80% of cases (but too much for any one of them).

Decision
--------

We introduce an explicit alias for the default service set, ``large-and-slow``, and introduce targets like ``dev.pull.large-and-slow``. Creating a name for the large set with a built-in warning may help warn people away from it.

Next, any direct usage of the bare target ``dev.pull`` triggers a warning in the terminal and an opportunity to cancel and use a more tightly scoped command. Using ``dev.pull.large-and-slow`` directly bypasses this warning; this set may still be needed for some use-cases, such as initial provisioning. This allows us to educate a broader range of developers (not just the ones who come and ask for help) and tighten the feedback loop to seconds rather than hours (warning in terminal vs. discussion in chat.)

Finally, documentation is to be updated to better explain this distinction, and any mention of ``dev.pull`` updated to either ``dev.pull.large-and-slow`` or ``dev.pull.<service>`` so that readers will be steered in the correct direction from the outset.

The first pass only changes the ``pull`` and ``up`` families of make targets, since we believe they are the most commonly used and the most common to cause developer pain. ``provision``, ``check``, ``migrate``, and ``reset`` are good candidates for after this is proved out.

Use of ``DEFAULT_SERVICES`` and the make targets which rely on it is not deprecated, but should always be an intentional act.

Consequences
------------

People will be steered away from bare targets like ``dev.pull`` and ``DEFAULT_SERVICES`` may be reduced in importance.

Developers first setting up devstack will still use the large set, since some parts of provisioning (specifically, the loading of test data) have non-trivial dependencies between services.

Rejected Alternatives
---------------------

- Shrinking ``DEFAULT_SERVICES``: Likely to break any number of workflows, or at least confuse people who rely on it.
- Just document it better: We don't think people read the docs enough to discover docs on this issue. People probably mostly go looking through the docs when they have a specific error or a task they want to learn how to accomplish, but they may not even identify overly large service sets as a problem to solve.
