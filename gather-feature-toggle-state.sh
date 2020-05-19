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

credentials_id="$(make --silent dev.print-container.credentials)"
docker exec -t "$credentials_id" bash -c 'source /edx/app/credentials/credentials_env && python /edx/app/credentials/credentials/manage.py dumpdata waffle --format=json > /edx/app/credentials/credentials/credentials_waffle.json'
docker cp "$credentials_id":/edx/app/credentials/credentials/credentials_waffle.json feature-toggle-data
docker exec -t "$credentials_id" bash -c 'rm /edx/app/credentials/credentials/credentials_waffle.json'

discovery_id="$(make --silent dev.print-container.discovery)"
docker exec -t "$discovery_id" bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py dumpdata waffle --format=json > /edx/app/discovery/discovery/discovery_waffle.json'
docker cp "$discovery_id":/edx/app/discovery/discovery/discovery_waffle.json feature-toggle-data
docker exec -t "$discovery_id" bash -c '> /edx/app/discovery/discovery/discovery_waffle.json'

ecommerce_id="$(make --silent dev.print-container.ecommerce)"
docker exec -t "$ecommerce_id" bash -c 'source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py dumpdata waffle --format=json > /edx/app/ecommerce/ecommerce/ecommerce_waffle.json'
docker cp "$ecommerce_id":/edx/app/ecommerce/ecommerce/ecommerce_waffle.json feature-toggle-data
docker exec -t "$ecommerce_id" bash -c 'rm /edx/app/ecommerce/ecommerce/ecommerce_waffle.json'

lms_id="$(make --silent dev.print-container.lms)"
docker exec -t "$lms_id" bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms dumpdata waffle --format=json > /edx/app/edxapp/edx-platform/lms_waffle.json'
docker exec -t "$lms_id" bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms dumpdata waffle_utils --format=json > /edx/app/edxapp/edx-platform/lms_waffle_utils.json'
docker cp "$lms_id":/edx/app/edxapp/edx-platform/lms_waffle.json feature-toggle-data
docker cp "$lms_id":/edx/app/edxapp/edx-platform/lms_waffle_utils.json feature-toggle-data
docker exec -t "$lms_id" bash -c 'rm /edx/app/edxapp/edx-platform/lms_waffle*.json'
