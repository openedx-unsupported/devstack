#!/bin/bash

# Script for cloning Git repos housing edX services. These repos are mounted as
# data volumes into their corresponding Docker containers to facilitate development.
# Repos are cloned to the directory above the one housing this file.

repos=(
    "https://github.com/edx/course-discovery.git"
    "https://github.com/edx/credentials.git"
    "https://github.com/edx/ecommerce.git"
    "https://github.com/edx/edx-platform.git"
    "https://github.com/edx/programs.git"
)

name_pattern=".*edx/(.*).git"

for repo in ${repos[*]}
do
    # Use Bash's regex match operator to capture the name of the repo.
    # Results of the match are saved to an array called $BASH_REMATCH.
    [[ $repo =~ $name_pattern ]]
    name="${BASH_REMATCH[1]}"

    cd ..
    if [ -d "$name" ]; then
        printf "The [%s] repo is already checked out. Continuing.\n" $name
    else
        git clone $repo
    fi
    cd - &> /dev/null
done
