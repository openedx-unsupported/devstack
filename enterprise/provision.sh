#!/usr/bin/env bash
set -eu -o pipefail
set -x

docker-compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user enterprise_worker enterprise_worker@example.com --staff'
cat enterprise/worker_permissions.py | docker-compose exec -T lms bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms shell  --settings=devstack_docker'
