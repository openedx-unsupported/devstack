#!/bin/bash

set -e
set -x

if [[ $DEVSTACK == 'lms' ]]; then
    make dev.pull.discovery
    make dev.pull.forum
    make dev.provision.lms
    make dev.provision.discovery
    make dev.provision.forum
    make no_cache=True dev.up.lms
    sleep 60  # LMS needs like 60 seconds to come up
    make healthchecks.lms
    make healthchecks.discovery
    make healthchecks.forum
    make validate-lms-volume
    make up-marketing-detached
fi

if [[ $DEVSTACK == 'registrar' ]]; then
    make dev.provision.registrar
    make no_cache=True dev.up.registrar
    sleep 60
    make healthchecks.registrar

fi

if [[ $DEVSTACK == 'ecommerce' ]]; then
    make dev.provision.ecommerce
    make no_cache=True dev.up.ecommerce
    sleep 60
    make healthchecks.ecommerce

fi

if [[ $DEVSTACK == 'edx_notes_api' ]]; then
    make dev.provision.edx_notes_api
    make no_cache=True dev.up.edx_notes_api
    sleep 60
    make healthchecks.edx_notes_api

fi

if [[ $DEVSTACK == 'credentials' ]]; then
    make dev.provision.credentials
    make no_cache=True dev.up.credentials
    sleep 60
    make healthchecks.credentials

fi


if [[ $DEVSTACK == 'analytics_pipeline' ]]; then
    make dev.provision.analytics_pipeline
    make dev.up.analytics_pipeline
    sleep 30 # hadoop services need some time to be fully functional and out of safemode
    make analytics-pipeline-devstack-test
fi
