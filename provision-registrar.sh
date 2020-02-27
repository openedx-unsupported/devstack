#!/usr/bin/env bash
set -e
set -o pipefail
set -x

name=registrar
port=18734

docker-compose $DOCKER_COMPOSE_FILES up -d $name

./provision-ida.sh "$name" "$name" "$port" "$name"
