#!/bin/bash
# Wait for the listed services to become ready.
#
# This does not start the containers; that should be performed separately
# via `make dev.up` in order to allow for parallel startup.

set -eu -o pipefail

function print_usage {
    echo "Usage: $0 service1 service2 ..."
}

if [[ $# == 0 ]]; then
    print_usage
    exit 0
fi

for service_name in "$@"; do
    until ./check.sh "$service_name" >/dev/null 2>&1; do
        printf "." >&2
        sleep 1
    done
    echo >&2 "$service_name is ready"
done
