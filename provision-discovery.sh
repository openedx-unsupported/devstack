#!/usr/bin/env bash
# Provisioning script for the discovery service
set -eu -o pipefail
set -x

./provision-ida.sh discovery discovery 18381

docker-compose exec -T discovery bash -e -c 'rm -rf /edx/var/discovery/*'
docker-compose exec -T discovery bash -e -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py create_or_update_partner --site-id 1 --site-domain localhost:18381 --code edx --name edX --courses-api-url "http://edx.devstack.lms:18000/api/courses/v1/" --lms-coursemode-api-url "http://edx.devstack.lms:18000/api/course_modes/v1/" --ecommerce-api-url "http://edx.devstack.ecommerce:18130/api/v2/" --organizations-api-url "http://edx.devstack.lms:18000/api/organizations/v0/" --lms-url "http://edx.devstack.lms:18000/" --studio-url "http://edx.devstack.studio:18010/" --publisher-url "http://edx.devstack.frontend-app-publisher:18400/"'

set +e
# FIXME[bash-e]: Bash scripts should use -e -- but this script fails
# (after many retries) when trying to talk to ecommerce
docker-compose exec -T discovery bash -e -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py refresh_course_metadata'
set -e

docker-compose exec -T discovery bash -e -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py update_index --disable-change-limit'

# Add demo program
./programs/provision.sh discovery
