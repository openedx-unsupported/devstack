#!/usr/bin/env bash

set -e
set -o pipefail

# Script for Git repos housing edX services. These repos are mounted as
# data volumes into their corresponding Docker containers to facilitate development.
# Repos are cloned to/removed from the directory above the one housing this file.

if [ -z "$DEVSTACK_WORKSPACE" ]; then
    echo "need to set workspace dir"
    exit 1
elif [ -d "$DEVSTACK_WORKSPACE" ]; then
    cd "$DEVSTACK_WORKSPACE"
else
    echo "Workspace directory $DEVSTACK_WORKSPACE doesn't exist"
    exit 1
fi

# When you add new services should add them to both repos and ssh_repos
# (or non_release_repos and non_release_ssh_repos if they are not part
# of Open edX releases).
repos=(
    "https://github.com/edx/course-discovery.git"
    "https://github.com/edx/credentials.git"
    "https://github.com/edx/cs_comments_service.git"
    "https://github.com/edx/ecommerce.git"
    "https://github.com/edx/edx-e2e-tests.git"
    "https://github.com/edx/edx-notes-api.git"
    "https://github.com/edx/edx-platform.git"
    "https://github.com/edx/xqueue.git"
    "https://github.com/edx/frontend-app-gradebook.git"
    "https://github.com/edx/frontend-app-publisher.git"
)

non_release_repos=(
    "https://github.com/edx/frontend-app-course-authoring.git"
    "https://github.com/edx/frontend-app-learning.git"
    "https://github.com/edx/frontend-app-library-authoring.git"
    "https://github.com/edx/registrar.git"
    "https://github.com/edx/frontend-app-program-console.git"
)

ssh_repos=(
    "git@github.com:edx/course-discovery.git"
    "git@github.com:edx/credentials.git"
    "git@github.com:edx/cs_comments_service.git"
    "git@github.com:edx/ecommerce.git"
    "git@github.com:edx/edx-e2e-tests.git"
    "git@github.com:edx/edx-notes-api.git"
    "git@github.com:edx/edx-platform.git"
    "git@github.com:edx/xqueue.git"
    "git@github.com:edx/frontend-app-gradebook.git"
    "git@github.com:edx/frontend-app-publisher.git"
)

non_release_ssh_repos=(
    "git@github.com:edx/frontend-app-course-authoring.git"
    "git@github.com:edx/frontend-app-learning.git"
    "git@github.com:edx/frontend-app-library-authoring.git"
    "git@github.com:edx/registrar.git"
    "git@github.com:edx/frontend-app-program-console.git"
)

private_repos=(
    # Needed to run whitelabel tests.
    "https://github.com/edx/edx-themes.git"
)

if [ -n "${OPENEDX_RELEASE}" ]; then
    OPENEDX_GIT_BRANCH=open-release/${OPENEDX_RELEASE}
else
    OPENEDX_GIT_BRANCH=master
    repos+=("${non_release_repos[@]}")
    ssh_repos+=("${non_release_ssh_repos[@]}")
fi

name_pattern=".*/(.*).git"

_checkout ()
{
    repos_to_checkout=("$@")

    for repo in "${repos_to_checkout[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"

        # If a directory exists and it is nonempty, assume the repo has been cloned.
        if [ -d "$name" ] && [ -n "$(ls -A "$name" 2>/dev/null)" ]; then
            echo "Checking out branch ${OPENEDX_GIT_BRANCH} of $name"
            cd "$name"
            _checkout_and_update_branch
            cd ..
        fi
    done
}

checkout ()
{
    _checkout "${repos[@]}"
}

_clone ()
{

    repos_to_clone=("$@")
    for repo in "${repos_to_clone[@]}"
    do
        # Use Bash's regex match operator to capture the name of the repo.
        # Results of the match are saved to an array called $BASH_REMATCH.
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"

        # If a directory exists and it is nonempty, assume the repo has been checked out
        # and only make sure it's on the required branch
        if [ -d "$name" ] && [ -n "$(ls -A "$name" 2>/dev/null)" ]; then
            if [ ! -d "$name/.git" ]; then
                printf "ERROR: [%s] exists but is not a git repo.\n" "$name"
                exit 1
            fi
            printf "The [%s] repo is already checked out. Checking for updates.\n" "$name"
            cd "${DEVSTACK_WORKSPACE}/${name}"
            _checkout_and_update_branch
            cd ..
        else
            if [ "${SHALLOW_CLONE}" == "1" ]; then
                git clone -b ${OPENEDX_GIT_BRANCH} -c core.symlinks=true --depth=1 "${repo}"
            else
                git clone -b ${OPENEDX_GIT_BRANCH} -c core.symlinks=true "${repo}"
            fi
        fi
    done
    cd - &> /dev/null
}

_checkout_and_update_branch ()
{
    GIT_SYMBOLIC_REF="$(git symbolic-ref HEAD 2>/dev/null)"
    BRANCH_NAME=${GIT_SYMBOLIC_REF##refs/heads/}
    if [ "${BRANCH_NAME}" == "${OPENEDX_GIT_BRANCH}" ]; then
        git pull origin ${OPENEDX_GIT_BRANCH}
    else
        git fetch origin ${OPENEDX_GIT_BRANCH}:${OPENEDX_GIT_BRANCH}
        git checkout ${OPENEDX_GIT_BRANCH}
    fi
    find . -name '*.pyc' -not -path './.git/*' -delete
}

clone ()
{
    _clone "${repos[@]}"
}

clone_ssh ()
{
    _clone "${ssh_repos[@]}"
}

clone_private ()
{
    _clone "${private_repos[@]}"
}

reset ()
{
    for repo in ${repos[*]}
    do
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"

        if [ -d "$name" ]; then
            (cd "$name"; git checkout -q master && git pull -q --ff-only) || {
                echo >&2 "Failed to reset $name repo. Exiting."
                echo >&2 "Please go to the repo and clean up any issues that are keeping 'git checkout master' and 'git pull' from working."
                exit 1
            }
        else
            printf "The [%s] repo is not cloned. Continuing.\n" "$name"
        fi
    done
}

status ()
{
    currDir=$(pwd)
    for repo in ${repos[*]}
    do
        [[ $repo =~ $name_pattern ]]
        name="${BASH_REMATCH[1]}"

        if [ -d "$name" ]; then
            printf "\nGit status for [%s]:\n" "$name"
            cd "$name";git status;cd "$currDir"
        else
            printf "The [%s] repo is not cloned. Continuing.\n" "$name"
        fi
    done
    cd - &> /dev/null
}

if [ "$1" == "checkout" ]; then
    checkout
elif [ "$1" == "clone" ]; then
    clone
elif [ "$1" == "clone_ssh" ]; then
    clone_ssh
elif [ "$1" == "whitelabel" ]; then
    clone_private
elif [ "$1" == "reset" ]; then
    read -p "This will override any uncommited changes in your local git checkouts. Would you like to proceed? [y/n] " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        reset
    fi
elif [ "$1" == "status" ]; then
    status
fi
