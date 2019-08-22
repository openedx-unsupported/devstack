#!/bin/bash

set -e
set -x

make dev.provision
wget https://raw.githubusercontent.com/sumbul03/edx-theme/master/lms.env.json
docker cp lms.env.json edx.devstack.lms:/edx/app/edxapp/lms.env.json
cat lms.env.json
make dev.up
sleep 60  # LMS needs like 60 seconds to come up
make lms-static


if [[ $DEVSTACK == 'analytics_pipeline' ]]; then
    make dev.provision.analytics_pipeline
    make dev.up.analytics_pipeline
    sleep 30 # hadoop services need some time to be fully functional and out of safemode
    make analytics-pipeline-devstack-test
fi
