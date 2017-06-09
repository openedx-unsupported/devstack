#This script depends on the LMS being up!

name=$1
port=$2

echo -e "${GREEN}Creating service user and OAuth client for ${name}...${NC}"
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user $1_worker $1_worker@example.com --staff --superuser' -- "$name"
docker exec -t edx.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_oauth2_client "http://localhost:$2" "http://localhost:$2/complete/edx-oidc/" confidential --client_name $1 --client_id "$1-key" --client_secret "$1-secret" --trusted --logout_uri "http://localhost:$2/logout/" --username $1_worker' -- "$name" "$port"
