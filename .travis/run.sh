#!/bin/bash

set -e
set -x

if [[ $DEVSTACK == 'lms' ]]; then
    make dev.pull.discovery
    make dev.pull.forum
    make dev.provision.lms
    make dev.provision.discovery
    make dev.provision.forum
    make dev.up.lms
    make dev.up.discovery
    make dev.up.forum
    sleep 60  # LMS needs like 60 seconds to come up
    make healthchecks.lms
    make healthchecks.discovery
    make healthchecks.forum
    make validate-lms-volume
    make up-marketing-detached
fi

if [[ $DEVSTACK == 'registrar' ]]; then
    make dev.provision.registrar
    make dev.up.registrar
    sleep 60
    make healthchecks.registrar

fi

if [[ $DEVSTACK == 'ecommerce' ]]; then
    make dev.provision.ecommerce
    make dev.up.ecommerce
    sleep 60
    make healthchecks.ecommerce

fi

if [[ $DEVSTACK == 'discovery' ]]; then
    make dev.provision.discovery
    make dev.up.discovery
    sleep 60
    make healthchecks.discovery

fi

if [[ $DEVSTACK == 'forum' ]]; then
    make dev.provision.forum
    make dev.up.forum
    sleep 60
    make healthchecks.forum

fi

if [[ $DEVSTACK == 'analytics_pipeline' ]]; then
    echo "HAHAHAH"
    make dev.provision.analytics_pipeline
    echo "HAHAHAH2"
    make dev.up.analytics_pipeline
    echo "fgsdgfs"
    sleep 30 # hadoop services need some time to be fully functional and out of safemode
    make analytics-pipeline-devstack-test
fi
