#!/bin/bash

set -e
set -x

if [[ $DEVSTACK == 'lms' ]]; then
    make dev.provision
    make dev.up
    sleep 60  # LMS needs like 60 seconds to come up
    make healthchecks
    make validate-lms-volume
    # Disable e2e-tests until either:
    # * tests are less flaky
    # * We have a way to test the infrastructure for testing but ignore the test results.
    # See PLAT-1712
    # - make e2e-tests
    make up-marketing-detached
fi

if [[ $DEVSTACK == 'registrar' ]]; then
    make dev.provision.registrar
    make dev.up.registrar
    sleep 60
    make helthchecks.registrar

fi

if [[ $DEVSTACK == 'analytics_pipeline' ]]; then
    make dev.provision.analytics_pipeline
    make dev.up.analytics_pipeline
    sleep 30 # hadoop services need some time to be fully functional and out of safemode
    make analytics-pipeline-devstack-test
fi
