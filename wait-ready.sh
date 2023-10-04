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

function wait_db {
    container_name="$1"
    mysql_probe="SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')"
    until docker compose exec -T "$container_name" mysql -uroot -se "$mysql_probe" &> /dev/null; do
        printf "." >&2
        sleep 1
    done
    echo >&2 "$container_name is ready"
}


for service_name in "$@"; do
    case "$service_name" in
        mysql*)
            wait_db "$service_name"
            ;;
        # TODO: Add other services...
        *)
            echo >&2 "Unknown service: $service_name"
            exit 1
            ;;
    esac
done
