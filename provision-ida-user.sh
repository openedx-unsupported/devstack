#This script depends on the LMS being up!

app_name=$1
client_name=$2
client_port=$3

echo -e "${GREEN}Creating service user and OAuth client for ${app_name}...${NC}"
docker exec -t b2b.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user $1_worker $1_worker@example.com --staff --superuser' -- "$app_name"
docker exec -t b2b.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_oauth2_client "http://localhost:$3" "http://localhost:$3/complete/edx-oidc/" confidential --client_name $2 --client_id "$1-key" --client_secret "$1-secret" --trusted --logout_uri "http://localhost:$3/logout/" --username $1_worker' -- "$app_name" "$client_name" "$client_port"
