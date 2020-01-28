#!/bin/bash

set -e
set -x

if [[ "$DEVSTACK" == "analytics_pipeline" ]]; then
    make dev.provision.analytics_pipeline
    make dev.up.analytics_pipeline
    sleep 30 # hadoop services need some time to be fully functional and out of safemode
    make analytics-pipeline-devstack-test
elif [[ "$DEVSTACK" == "lms" ]]; then
    make dev.pull.discovery dev.pull.forum
    make dev.provision.services.lms+discovery+forum
    make no_cache=True dev.up.lms
    sleep 60  # LMS needs like 60 seconds to come up
    make healthchecks.lms healthchecks.discovery validate-lms-volume
    make up-marketing-detached
else
    service="$DEVSTACK"
    make dev.provision.services."$service"
    make no_cache=True dev.up."$service"
    sleep 60
    make healthchecks."$service"
fi
