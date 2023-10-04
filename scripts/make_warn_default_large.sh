#!/bin/bash
# Warn the developer that they've run a make command that uses a very
# large set of services and that often is not the best tool for the
# job.
#
# This script is used in the Makefile for commands that should be run
# as `make $target.large-and-slow` instead if that's what's intended.

target="$1"

show_warning_and_wait() {
    cat <<"EOCOW" >&2
 _________________________________________________________________________
/                                                                         \
| Are you sure you want to run this command for *all* Open edX services?  |
\_________________________________________________________________________/
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

EOCOW

    cat <<EOF >&2
The command "make $target" will operate on a large default set of
services and their dependencies. This can make your task take longer
than necessary.

You may prefer to use something like "make $target.lms" to
target a smaller set of services.  Learn more about the commands you
can run at:

  https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/devstack_interface.html

Without an explicit list of services, many devstack Make targets pull
down Docker images you don't need or take up extra memory and CPU. You
might even run into bugs in unrelated services.

(If you *really* want the large default set of services, you can use
the command "make $target.large-and-slow". You can also configure
DEFAULT_SERVICES in your options.local.mk to your preferred smaller
set of services. Either of these options will prevent this warning.)

EOF

    read -r -p $'(You can cancel the command now with Ctrl-C or press ENTER to continue.)\n'
}

if grep --quiet --no-messages '^DEFAULT_SERVICES' options.local.mk; then
    echo >&2 "Skipping warning because DEFAULT_SERVICES is set in options.local.mk"
else
    show_warning_and_wait
fi

make --no-print-directory "$target.large-and-slow"
