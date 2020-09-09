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
    cd $DEVSTACK_WORKSPACE
else
    echo "Workspace directory $DEVSTACK_WORKSPACE doesn't exist"
    exit 1
fi

repos=(
#    "https://github.com/Edraak/course-discovery.git"
#    "https://github.com/Edraak/credentials.git"
    "https://github.com/Edraak/cs_comments_service.git"
#    "https://github.com/Edraak/ecommerce.git"
#    "https://github.com/Edraak/edx-e2e-tests.git"
#    "https://github.com/Edraak/edx-notes-api.git"
    "https://github.com/Edraak/edraak-platform.git"
#    "https://github.com/Edraak/xqueue.git"
#    "https://github.com/Edraak/edx-analytics-pipeline.git"
    "git@github.com:Edraak/marketing-site.git"
    "git@github.com:Edraak/edraak-programs.git"
    "git@github.com:Edraak/edraak-2019-theme.git"
    "git@github.com:Edraak/shared-devstack-configs.git"
    "git@github.com:Edraak/programs-theme-white.git"
)

repo_alternative_directory=(
	"https://github.com/Edraak/edraak-platform.git,edx-platform"
	"git@github.com:Edraak/edraak-2019-theme.git,src/edraak-2019-theme"
  "git@github.com:Edraak/shared-devstack-configs.git,src/edxapp-envs"
  "git@github.com:Edraak/programs-theme-white.git,src/progs-theme"
)

private_repos=(
    # Needed to run whitelabel tests.
    "https://github.com/edx/edx-themes.git"
)

name_pattern=".*Edraak/(.*).git"

_get_name()
{
	for altdir in "${repo_alternative_directory[@]}"
	do
		# Use Bash's regex match operator to capture the name of the repo.
		# Results of the match are saved to an array called $BASH_REMATCH.
		[[ $altdir =~ (.*),(.*) ]]

		if [ "${1}" == "${BASH_REMATCH[1]}" ]; then
			echo "${BASH_REMATCH[2]}"
			return 0
		fi
	done

	[[ $1 =~ $name_pattern ]]
	echo "${BASH_REMATCH[1]}"
}

_checkout ()
{
    repos_to_checkout=("$@")

    if [ -z "$OPENEDX_RELEASE" ]; then
        branch="master"
    else
        branch="open-release/${OPENEDX_RELEASE}"
    fi


    for repo in "${repos_to_checkout[@]}"
    do
        name=$(_get_name $repo)

        # If a directory exists and it is nonempty, assume the repo has been cloned.
        if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
            cd $name

            branch=master
            echo "Checking out branch $branch of $name"
            git pull
            git checkout "$branch"
            cd -
        fi
    done
}

checkout ()
{
    _checkout "${repos[@]}"
}

_clone ()
{
    # for repo in ${repos[*]}
    repos_to_clone=("$@")

    for repo in "${repos_to_clone[@]}"
    do
        name=$(_get_name $repo)

        # If a directory exists and it is nonempty, assume the repo has been checked out.
        if [ -d "$name" -a -n "$(ls -A "$name" 2>/dev/null)" ]; then
            printf "The [%s] repo is already checked out. Continuing.\n" $name
        else
            if [ "${SHALLOW_CLONE}" == "1" ]; then
                git clone --depth=1 $repo $name
            else
                git clone $repo $name
            fi
            cd $name
            branch=master
            git checkout "$branch"
            cd -
        fi
    done
    cd - &> /dev/null
}

clone ()
{
    _clone "${repos[@]}"
}

clone_private ()
{
    _clone "${private_repos[@]}"
}

reset ()
{
    currDir=$(pwd)
    for repo in ${repos[*]}
    do
        name=$(_get_name $repo)

        branch=master
        if [ -d "$name" ]; then
            cd $name;git reset --hard HEAD;git checkout "$branch";git reset --hard "origin/$branch";git pull;cd "$currDir"
        else
            printf "The [%s] repo is not cloned. Continuing.\n" $name
        fi
    done
    cd - &> /dev/null
}

status ()
{
    currDir=$(pwd)
    for repo in ${repos[*]}
    do
        name=$(_get_name $repo)

        if [ -d "$name" ]; then
            printf "\nGit status for [%s]:\n" $name
            cd $name;git status;cd "$currDir"
        else
            printf "The [%s] repo is not cloned. Continuing.\n" $name
        fi
    done
    cd - &> /dev/null
}

if [ "$1" == "checkout" ]; then
    checkout
elif [ "$1" == "clone" ]; then
    clone
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
