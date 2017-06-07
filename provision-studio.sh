#!/usr/bin/env bash

set -e
set -o pipefail
set -x

# Nothing special needed for studio
docker-compose $DOCKER_COMPOSE_FILES up -d studio
