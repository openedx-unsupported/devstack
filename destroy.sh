#!/usr/bin/env bash
set -eu -o pipefail

read -p "This will delete all data in your devstack. Would you like to proceed? [y/n] " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker compose down -v
fi
