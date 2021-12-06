#!/usr/bin/env bash
set -xeuo pipefail
. scripts/colors.sh

# This script depends on the LMS being up!

app_name=$1
user_name=$2

echo -e "${GREEN}Creating retirement service user ${user_name} and DOT Application ${app_name} in LMS...${NC}"

docker-compose exec -T lms  bash -e -c \
	"./manage.py lms manage_user '${user_name}' '${user_name}@example.com' \
		--staff \
		--superuser"

docker-compose exec -T lms  bash -e -c \
	"./manage.py lms create_dot_application '${app_name}' '${user_name}'"
