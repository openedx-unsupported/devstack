#!/bin/bash

read -p "This will delete ALL docker and local Git data. Would you like to proceed? [y/n] " -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # 1. Ensure all docker containers, images, and volumes are cleaned up
    # Stop all containers
    docker stop $(docker ps -a -q)
    # Delete all containers
    docker rm $(docker ps -a -q)
    # Delete all images
    docker rmi $(docker images -q)
    # Delete all volumes
    docker volume rm -f $(docker volume ls -q)

    # 2. Remove and remake workspace directory
    rm -rf ~/workspace
    mkdir ~/workspace/
    cd ~/workspace

    # 3. Rebuild the system
    git clone https://github.com/edx/devstack.git # git@github.com:edx/devstack.git
    cd devstack
    make requirements
    make dev.clone
    make dev.provision
    make dev.up

    # 4. Possible way to handle optional/additional repo-cloning? i.e. our team always needs studio-frontend
fi
