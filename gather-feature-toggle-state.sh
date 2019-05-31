#!/usr/bin/env bash

# gather-feature-toggle-state.sh

# as part of our feature toggle reporting utility, this script can be run
# against a running devstack to collect the state of all of feature toggles
# (django-waffle, waffle-utils) currently configured for each of the IDAs
# that use them.

if [ -e feature-toggle-data ]; then
    rm -Rf feature-toggle-data
fi
mkdir feature-toggle-data

docker exec -t edx.devstack.credentials bash -c 'source /edx/app/credentials/credentials_env && python /edx/app/credentials/credentials/manage.py dumpdata waffle --format=yaml > /edx/app/credentials/credentials/credentials_waffle.yml'
docker cp edx.devstack.credentials:/edx/app/credentials/credentials/credentials_waffle.yml feature-toggle-data
docker exec -t edx.devstack.credentials bash -c 'rm /edx/app/credentials/credentials/credentials_waffle.yml'

docker exec -t edx.devstack.discovery bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py dumpdata waffle --format=yaml > /edx/app/discovery/discovery/discovery_waffle.yml'
docker cp edx.devstack.discovery:/edx/app/discovery/discovery/discovery_waffle.yml feature-toggle-data
docker exec -t edx.devstack.discovery bash -c '> /edx/app/discovery/discovery/discovery_waffle.yml'

docker exec -t edx.devstack.ecommerce bash -c 'source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py dumpdata waffle --format=yaml > /edx/app/ecommerce/ecommerce/ecommerce_waffle.yml'
docker cp edx.devstack.ecommerce:/edx/app/ecommerce/ecommerce/ecommerce_waffle.yml feature-toggle-data
docker exec -t edx.devstack.ecommerce bash -c 'rm /edx/app/ecommerce/ecommerce/ecommerce_waffle.yml'

docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms dumpdata waffle --format=yaml > /edx/app/edxapp/edx-platform/lms_waffle.yml'
docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms dumpdata waffle_utils --format=yaml > /edx/app/edxapp/edx-platform/lms_waffle_utils.yml'
docker cp edx.devstack.lms:/edx/app/edxapp/edx-platform/lms_waffle.yml feature-toggle-data
docker cp edx.devstack.lms:/edx/app/edxapp/edx-platform/lms_waffle_utils.yml feature-toggle-data
docker exec -t edx.devstack.lms bash -c 'rm /edx/app/edxapp/edx-platform/lms_waffle*.yml'
