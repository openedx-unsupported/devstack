#!/usr/bin/env bash
set -eu -o pipefail
set -x

#
# To add programs support, we need to tweak/add certain rows in the database.
# We want to go through Django for this (rather than direct db modification), since we have a lot of Python
# side-effect code and validation in our models.
#
# We *could* create several tiny management commands. But this use case is very special cased. Instead, we just
# have the scripts here and pass them into Django's management shell.
#
# But to get the commands through Docker and Django intact, we have to do some creative quoting.

# Run this command with no arguments to completely provision an existing devstack.
# This can be run multiple times in a row with no ill effect (it's idempotent).

BASEDIR=$(dirname "$0")

# Main items are green, rest is dull grey since they are noisy, but we still might want to see their output,
# for error cases and the like.
notice() {
    SWITCH='\033['
    GREY="${SWITCH}1;90m"
    GREEN="${SWITCH}0;32m"
    echo -e "${GREEN}${@}${GREY}"
}

# We reset color once we're done with the script.
# If we wanted to be really fancy, we'd trap signals and reset there too.
reset_color() {
    SWITCH="\033["
    NORMAL="${SWITCH}0m"
    echo -e -n "${NORMAL}"
}

docker_exec() {
    service=${1}
    cmd=${2}
    app=${3:-$service}
    repo=${4:-$app}

    CMDS="
    source /edx/app/$app/${app}_env &&
    /edx/app/$app/$repo/manage.py $cmd
    "

    docker compose exec -T "$service" bash -e -c "$CMDS"
}

provision_ida() {
    service=$1
    cmd=$2
    shift 2

    # Escape double quotes and backticks from the Python
    PROGRAM_SCRIPT="$(sed -E 's/("|`)/\\\1/g' < "$BASEDIR/$service.py")"

    cmd="$cmd -c \"$PROGRAM_SCRIPT\""

    docker_exec "$service" "$cmd" "$@"
}

trap reset_color 1 2 3 6 15

if [ "$1" = "lms" -o -z "$1" ]; then
    notice Adding program support to LMS...
    provision_ida lms "lms shell" edxapp edx-platform
fi

if [ "$1" = "discovery" -o -z "$1" ]; then
    notice Adding demo program to Discovery...
    set +e
    # FIXME[bash-e]: Bash scripts should use -e -- but this command fails
    provision_ida discovery "shell"
    set -e
fi

if [ "$1" = "cache" -o -z "$1" ]; then
    notice Caching programs inside the LMS...
    docker_exec lms "lms cache_programs" edxapp edx-platform
fi

reset_color
