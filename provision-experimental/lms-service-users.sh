#!/usr/bin/env bash
set -xeuo pipefail
. scripts/colors.sh

# This script depends on the LMS being up!

app_name="$1"
client_port="$2"

echo -e "${GREEN}Creating service user and OAuth2 applications for ${app_name}...${NC}"

# Create the service user.
docker-compose exec -T lms bash -e -c \
	"./manage.py lms manage_user ${app_name}_worker ${app_name}_worker@example.com \
		--staff \
		--superuser"

# Create the DOT application for single sign-on.
docker-compose exec -T lms bash -e -c \
	"./manage.py lms create_dot_application '${app_name}-sso' '${app_name}_worker' \
		--grant-type authorization-code \
		--skip-authorization \
		--redirect-uris 'http://localhost:${client_port}/complete/edx-oauth2/' \
		--client-id '${app_name}-sso-key' \
		--client-secret '${app_name}-sso-secret' \
		--scopes user_id"

# Create the DOT application for backend service IDA-to-IDA authentication.
docker-compose exec -T lms bash -e -c \
	"./manage.py lms create_dot_application '${app_name}-backend-service' '${app_name}_worker' \
		--grant-type client-credentials \
		--client-id '${app_name}-backend-service-key' \
		--client-secret '${app_name}-backend-service-secret'"
