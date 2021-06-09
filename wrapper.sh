#!/usr/bin/env bash
# Dynamic wrapper for Make targets. Performs interventions and metrics instrumention.
set -eu -o pipefail

called_target="$1"
shift

# Make apparently calls $SHELL -c pwd at the beginning of the block
if [[ $# -ge 2 && "$1 $2" = '-c pwd' ]]; then
    bash "$@"
    exit
fi

echo >&2 ">>> wrapper called with: $@"
echo >&2 ">>> wrapper sees env var as: ${DEVSTACK_MAKE_WRAPPER_HAS_RUN:-<missing>}"

function do_wrap() {
    echo >&2 ">>> instrumenting command: $called_target"

    # FIXME[fatal] This isn't conveyed to the next line's execution!
    export DEVSTACK_MAKE_WRAPPER_HAS_RUN=true
    bash "$@"
}

# Only instrument the outermost Make call
if [[ -z "${DEVSTACK_MAKE_WRAPPER_HAS_RUN:-}" ]]; then
    do_wrap "$@"
else
    echo >&2 ">>> skipping wrapper"
    bash "$@"    
fi
