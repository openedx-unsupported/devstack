#!/usr/bin/env bash
set -xeuo pipefail

# Load database dumps for the largest databases to save time
./load-db.sh edxapp
./load-db.sh edxapp_csmh

# Bring edxapp containers online
docker-compose up -d lms studio

# Reinstall local requirements.
# This is only necessary because edx-platform is mounted in from the host. If
# `make requirements` hasn't yet been run from the host's edx-platform checkout, then
# it will be missing the `.egg` files needed in order for setup.py entrypoints to
# be found correctly. If edx-platform weren't mounted from the host, then the `.egg`
# files from the image would suffice and this step wouldn't be necessary.
# We only need to do this for one of {lms, studio} because the generated artifacts
# we need are written to the host-mounted edx-platform repo, which is shared between
# the two services.
docker-compose exec -T lms    bash -e -c 'pip install -r requirements/edx/local.in'

# Run edxapp migrations first since they are needed for the service users and OAuth clients
docker-compose exec -T lms    bash -e -c './manage.py lms migrate'
docker-compose exec -T studio bash -e -c './manage.py cms migrate'

# Create demo course and users, including a staff and superuser.
docker-compose exec -T studio ./scripts/provision-demo-course.sh
docker-compose exec -T lms    ./scripts/provision-demo-users.sh

# Create an enterprise service user for edxapp and give them appropriate permissions
docker-compose exec -T lms bash -e -c \
	'./manage.py lms manage_user enterprise_worker enterprise_worker@example.com --staff'
docker-compose exec -T lms bash -e -c \
	'./manage.py lms shell' \
	< enterprise/worker_permissions.py

# Enable the LMS-E-Commerce integration
docker-compose exec -T lms bash -e -c './manage.py lms configure_commerce'

# Create static assets for both LMS and Studio
# (assets are saved to a shared volume, hence only one command).
docker-compose exec -T lms ./scripts/update-assets-dev.sh

# Allow LMS SSO for Studio
./provision-experimental/lms-service-users.sh studio 18010

# Provision a retirement service account user
./provision-experimental/lms-retirement-user.sh retirement retirement_service_worker

# Add demo program
./programs/provision.sh lms
