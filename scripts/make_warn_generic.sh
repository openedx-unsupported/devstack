#!/bin/bash
# Warn the developer that they've run a make command that uses a broad
# service set and that often is not the best tool for the job.

target="$1"

cat <<"EOCOW" >&2
 _________________________________________________________________________
/                                                                         \
| Are you sure you want to run this command for *all* Open edX services?  |
|                                                                         |
| Commands like "make dev.pull" will operate on a large default set of    |
| services and their dependencies. This can make your work take           |
| longer—you're probably pulling down Docker images you don't need and    |
| taking up memory and CPU by running services you don't need for your    |
| work. You might even run into bugs in unrelated services.               |
|                                                                         |
| You may prefer to use commands like "make dev.pull.lms+studio" to       |
| target a smaller set of services.                                       |
|                                                                         |
| Learn more about the commands you can run at:                           |
|                                                                         |
| https://github.com/edx/devstack/blob/master/docs/devstack_interface.rst |
|                                                                         |
| (And if you *really* want the default set of services, you can use      |
| commands like "make dev.pull.default".)                                 |
\_________________________________________________________________________/
       \
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

EOCOW

read -r -p $'(You can cancel the command now or press ENTER to continue.)\n'

make "$target.default"
