#!/usr/bin/env bash
set -eu -o pipefail
set -x

# FIXME[bash-e]: Bash scripts should use -e -- but this script fails
# with the following errors for ecommerce & edx_notes_api:
# - RuntimeError: Model class openedx.core.djangoapps.content_libraries.models.ContentLibrary doesn't declare an explicit app_label and isn't in an application in INSTALLED_APPS.
# - django.db.utils.ProgrammingError: (1146, "Table 'edxapp.auth_user' doesn't exist")
set +e

#This script depends on the LMS being up!

. scripts/colors.sh

app_name=$1
client_name=$2
client_port=$3

echo -e "${GREEN}Creating service user and OAuth2 applications for ${app_name}...${NC}"

# Create the service user.
docker-compose exec -T lms  bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user $1_worker $1_worker@example.com --staff --superuser' -- "$app_name"

# Create the DOT applications - one for single sign-on and one for backend service IDA-to-IDA authentication.
docker-compose exec -T lms  bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_dot_application --grant-type authorization-code --skip-authorization --redirect-uris "http://localhost:$3/complete/edx-oauth2/" --client-id "$1-sso-key" --client-secret "$1-sso-secret" --scopes "user_id" $1-sso $1_worker' -- "$app_name" "$client_name" "$client_port"
docker-compose exec -T lms  bash -e -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_dot_application --grant-type client-credentials --client-id "$1-backend-service-key" --client-secret "$1-backend-service-secret" $1-backend-service $1_worker' -- "$app_name" "$client_name" "$client_port"


# FIXME[bash-e]: Suppress last error so that calling script can set -e
# for itself. Remove this once *this* script is run entirely with `-e`
# in effect (or at least the last command is no longer erroring for
# any services).
true
