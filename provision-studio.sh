#!/usr/bin/env bash

set -e
set -o pipefail
set -u
set -x

docker-compose up -d studio

studio_exec(){
	docker-compose studio -T studio bash -c "source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 $*"
}

# Install dev requirements.
studio_exec make requirements

# Create static assets
lms_exec 'paver update_assets studio --settings devstack_docker'
