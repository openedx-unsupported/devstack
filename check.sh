#!/usr/bin/env bash
# Run checks for the provided service(s).
# To specify multiple services, separate them with spaces or plus signs (+).
# To specify all services, just pass in "all".
#
# Examples:
#  ./check.sh lms
#  ./check.sh lms+forum
#  ./check.sh lms+forum discovery
#  ./check.sh all
#
# Exists 0 if successful; non-zero otherwise.
#
# Fails if no services specified.
#
# Note that passing in a non-existent service will not fail if there are
# other successful checks.

set -e
set -o pipefail
set -u

# Grab all arguments into one string, replacing plus signs with spaces.
# Pad on either side with spaces so that the regex in `should_check` works correctly.
services=" ${*//+/ } "

# Which checks succeeded and failed.
succeeded=""
failed=""

# Returns whether service in first arg should be checked.
should_check() {
    local service="$1"
    if [[ "$services" == *" all "* ]] || [[ "$services" == *" $service "* ]]; then
        return 0  # Note that '0' means 'success' (i.e., true) in bash.
    else
        return 1
    fi
}

# Runs a check named $1 on service $2 using the command $3.
run_check() {
    local check_name="$1"
    local service="$2"
    local cmd="$3"
    echo "> $cmd"
    set +e  # Disable exit-on-error
    if $cmd; then  # Run the command itself and check if it succeeded.
        succeeded="$succeeded $check_name"
    else
        docker-compose logs "$service"
        failed="$failed $check_name"
    fi
    set -e  # Re-enable exit-on-error
    echo  # Newline
}

if should_check registrar; then
    echo "Checking Registrar heartbeat:"
    run_check registrar_heartbeat registrar \
        "curl --fail -L http://localhost:18734/heartbeat"
fi

if should_check lms; then
    echo "Checking LMS heartbeat:"
    run_check lms_heartbeat lms \
        "curl --fail -L http://localhost:18000/heartbeat"

    echo "Checking Studio heartbeat:"
    run_check studio_heartbeat lms \
        "curl --fail -L http://localhost:18010/heartbeat"

    echo "Validating LMS volume:"
    run_check lms_volume lms \
        "make validate-lms-volume"
fi

if should_check ecommerce; then
    echo "Checking ecommerce health:"
    run_check ecommerce_heartbeat ecommerce \
        "curl --fail -L http://localhost:18130/health/"
fi

if should_check discovery; then
    echo "Checking discovery health:"
    run_check discovery_heartbeat discovery \
        "curl --fail -L http://localhost:18381/health/"
fi

if should_check forum; then
    echo "Checking forum heartbeat:"
    run_check forum_heartbeat forum \
        "curl --fail -L http://localhost:44567/heartbeat"
fi

if should_check edx_notes_api; then
    echo "Checking edx_notes_api heartbeat:"
    run_check edx_notes_api_heartbeat edx_notes_api \
        "curl --fail -L http://localhost:18120/heartbeat"
fi

if should_check credentials; then
    echo "Checking credentials heartbeat:"
    run_check credentials_heartbeat credentials \
        "curl --fail -L http://localhost:18150/health"
fi

if should_check xqueue; then
    echo "Checking xqueue status:"
    run_check xqueue_heartbeat xqueue \
        "curl --fail -L http://localhost:18040/xqueue/status"
fi

if should_check marketing; then
    echo "Seeing if we can curl root of Marketing site: "
    run_check marketing_curl marketing \
        "curl --fail -L http://localhost:8080"
fi

echo "Successful checks:${succeeded:- NONE}"
echo "Failed checks:${failed:- NONE}"
if [[ "$succeeded" ]]; then
    echo "Check result: SUCCESS"
    exit 0
else
    echo "Check result: FAILURE"
    exit 2
fi
