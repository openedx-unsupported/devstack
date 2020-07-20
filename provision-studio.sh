#!/usr/bin/env bash

set -e
set -o pipefail
set -u
set -x

docker-compose pull studio

docker-compose up -d studio

studio_exec(){
	docker-compose studio -T studio bash -c "source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 $*"
}

make dev.migrate.studio

make dev.static.studio
