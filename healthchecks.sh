#!/bin/bash
# Query the hearbeat/health endpoints for the provided service(s).
# To specify multiple services, separate them with spaces or plus signs (+).
# To specify all services, just pass in "all".
#
# Examples:
#  ./healthchecks.sh lms
#  ./healthchecks.sh lms+forum
#  ./healthchecks.sh lms+forum discovery
#  ./healthchecks.sh all
#
# Exists 0 if successful; non-zero otherwise.
#
# Fails if no services specified.
#
# Note that passing in a non-existent service will not fail if there are
# other successful health checks.

set -e
set -o pipefail

# Grab all arguments into one string, replacing plus signs with spaces.
# Pad on either side with spaces so that the regex in `should_check` works correctly.
services=" ${@/+/ } "

# Which healthchecks succeeded and failed.
succeeded=""
failed=""

# Returns whether first arg should be health-checked.
should_check() {
    local service="$1"
    if [[ "$services" == *" all "* ]] || [[ "$services" == *" $service "* ]]; then
        return 0  # Note that '0' means 'success' (i.e., true) in bash.
    else
        return 1
    fi
}

# curls $2.
# If failed, shows logs and adds $1 to `failed`.
# Else, adds $1 to `succeeded`.
do_curl() {
    local service="$1"
    local url="$2"
    local compose_service="${3:-$service}"  # For logs. Defaults to $1 if not provided.
    local cmd="curl $url"
    echo "> $cmd"
    set +e  # Disable exit-on-error
    $cmd
    if [ $? -ne 0 ]; then
        docker-compose logs "$compose_service"
        failed="$failed $service"
    else
        succeeded="$succeeded $service"
    fi
    set -e  # Re-enable exit-on-error
    echo  # Newline
}

if should_check registrar; then
    echo "Checking Registrar heartbeat:"
    do_curl registrar http://localhost:18734/heartbeat
fi

if should_check lms; then
    echo "Checking LMS heartbeat:"
    do_curl lms http://localhost:18000/heartbeat
    echo "Checking Studio heartbeat:"
    do_curl studio http://localhost:18010/heartbeat lms
fi

if should_check ecommerce; then
    echo "Checking ecommerce health:"
    do_curl ecommerce http://localhost:18130/health/
fi

if should_check discovery; then
    echo "Checking discovery health:"
    do_curl discovery http://localhost:18381/health/
fi

if should_check forum; then
    echo "Checking forum heartbeat:"
    do_curl forum http://localhost:44567/heartbeat
fi

if should_check edx_notes_api; then
    echo "Checking edx_notes_api heartbeat:"
    do_curl edx_notes_api http://localhost:18120/heartbeat
fi

if should_check credentials; then
    echo "Checking credentials heartbeat:"
    do_curl credentials http://localhost:18150/heartbeat
fi

if should_check xqueue; then
    echo "Checking xqueue heartbeat:"
    do_curl xqueue http://localhost:18040/heartbeat
fi

echo "Successful healthchecks:${succeeded:- NONE}"
echo "Failed healthchecks:${failed:- NONE}"
if [[ "$succeeded" ]]; then
    exit 0
else
    exit 2
fi
