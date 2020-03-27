#!/bin/bash

set -e
set -o pipefail
set -x

if [[ "$DEVSTACK" == "analytics_pipeline" ]]; then
    make dev.provision.analytics_pipeline
    make dev.up.analytics_pipeline
    sleep 30 # hadoop services need some time to be fully functional and out of safemode
    make analytics-pipeline-devstack-test
elif [[ "$DEVSTACK" == "lms+marketing" ]]; then
    make dev.provision.services.lms
    make validate-lms-volume
    make up-marketing-detached
else
    make dev.provision.services."$DEVSTACK"
    make dev.up."$DEVSTACK"
    sleep 60
    make healthchecks."$DEVSTACK"
fi
