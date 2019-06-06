#This script depends on the LMS being up!

app_name=$1
client_name=$2
client_port=$3

echo -e "${GREEN}Creating service user and OAuth2 applications for ${app_name}...${NC}"

# Create the service user.
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user $1_worker $1_worker@example.com --staff --superuser' -- "$app_name"

# Create the DOP client. Eventually, these clients will *all* be deprecated in favor of DOT applications below.
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_oauth2_client "http://localhost:$3" "http://localhost:$3/complete/edx-oidc/" confidential --client_name $2 --client_id "$1-key" --client_secret "$1-secret" --trusted --logout_uri "http://localhost:$3/logout/" --username $1_worker' -- "$app_name" "$client_name" "$client_port"

# Create the DOT applications - one for single sign-on and one for backend service IDA-to-IDA authentication.
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_dot_application --grant-type authorization-code --skip-authorization --redirect-uris "http://localhost:$3/complete/edx-oauth2/" --client-id "$1-sso-key" --client-secret "$1-sso-secret" --scopes "user_id" $1-sso $1_worker' -- "$app_name" "$client_name" "$client_port"
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_dot_application --grant-type client-credentials --client-id "$1-backend-service-key" --client-secret "$1-backend-service-secret" $1-backend-service $1_worker' -- "$app_name" "$client_name" "$client_port"
