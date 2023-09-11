#!/usr/bin/env bash
#This script depends on the LMS being up!
set -eu -o pipefail

. scripts/colors.sh
set -x

app_name=$1
user_name=$2

echo -e "${GREEN}Creating retirement service user ${user_name} and DOT Application ${app_name}...${NC}"
docker compose exec -T lms  bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user $1 $1@example.com --staff --superuser' -- "$user_name"
docker compose exec -T lms  bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_dot_application $1 $2' -- "$app_name" "$user_name"
