#!/bin/bash

set -e
set -x

if [[ "$DEVSTACK" == "analytics_pipeline" ]]; then
    make dev.provision.analytics_pipeline
    make dev.up.analytics_pipeline
    sleep 30 # hadoop services need some time to be fully functional and out of safemode
    make analytics-pipeline-devstack-test
elif [[ "$DEVSTACK" == "lms+marketing" ]]; then
    make dev.provision.services.lms
    make dev.up.lms  # Brings up Discovery and Forum as dependencies.
    sleep 60  # LMS needs like 60 seconds to come up.
    make validate-lms-volume
    make up-marketing-detached
else
    case "$DEVSTACK" in
        # Other services can be added in here seperated by '|', i.e. "registrar|discovery)"
        registrar)
            echo "Provisioning LMS first because $DEVSTACK requires it"
            make dev.provision.services.lms
    esac
    make dev.provision.services."$DEVSTACK"
    make dev.up."$DEVSTACK"
    sleep 60
    make healthchecks."$DEVSTACK"
fi
