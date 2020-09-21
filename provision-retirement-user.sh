#This script depends on the LMS being up!

app_name=$1
user_name=$2

echo -e "${GREEN}Creating retirement service user ${user_name} and DOT Application ${app_name}...${NC}"
docker exec -t b2b.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user $1 $1@example.com --staff --superuser' -- "$user_name"
docker exec -t b2b.devstack.lms  bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker create_dot_application $1 $2' -- "$app_name" "$user_name"
