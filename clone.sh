#!/usr/bin/env bash

# Script for cloning Git repos housing edX services. These repos are mounted as
# data volumes into their corresponding Docker containers to facilitate development.
# Repos are cloned to the directory above the one housing this file.

if [ -z "$DEVSTACK_WORKSPACE" ]; then
    echo "need to set workspace dir"
    exit 1
elif [ -d "$DEVSTACK_WORKSPACE" ]; then
    cd $DEVSTACK_WORKSPACE
else
    echo "Workspace directory $DEVSTACK_WORKSPACE doesn't exist"
    exit 1
fi

repos=(
    "https://github.com/edx/course-discovery.git"
    "https://github.com/edx/credentials.git"
    "https://github.com/edx/ecommerce.git"
    "https://github.com/edx/edx-platform.git"
)

name_pattern=".*edx/(.*).git"

for repo in ${repos[*]}
do
    # Use Bash's regex match operator to capture the name of the repo.
    # Results of the match are saved to an array called $BASH_REMATCH.
    [[ $repo =~ $name_pattern ]]
    name="${BASH_REMATCH[1]}"

    if [ -d "$name" ]; then
        printf "The [%s] repo is already checked out. Continuing.\n" $name
    else
        if [ "$SHALLOW_CLONE" -eq 1 ]; then
            git clone --depth=1 $repo
        else
            git clone $repo
        fi
    fi
done
cd - &> /dev/null
