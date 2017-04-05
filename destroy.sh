#!/usr/bin/env bash

set -e

read -p "This will delete all data in your devstack. Would you like to proceed? [y/n] " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    docker-compose down
    docker volume rm devstack_mysql_data
    docker volume rm devstack_mongo_data
    docker volume rm devstack_elasticsearch_data
fi
