#!/usr/bin/env bash

set -e

read -p "This will delete all data in your devstack. Would you like to proceed? [y/n] " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    docker-compose -f docker-compose.yml -f docker-compose-watchers.yml -f docker-compose-state-manager.yml -f docker-compose-host.yml -f docker-compose-analytics-pipeline.yml down -v
fi
