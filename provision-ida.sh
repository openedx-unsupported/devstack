#!/usr/bin/env bash
set -e
set -o pipefail
set -x

app_name=$1  # The name of the IDA application, i.e. /edx/app/<app_name>
client_name=$2  # The name of the Oauth client stored in the edxapp DB.
client_port=$3  # The port corresponding to this IDA service in devstack.
container_name=${4:-$1} # (Optional) The name of the container.  If missing, will use app_name.

docker-compose $DOCKER_COMPOSE_FILES up -d $app_name

run_in_container_venv() {
	bash_command="cd /edx/app/${app_name}/${app_name} && source ../${app_name}_env && $@"
	docker exec -t edx.devstack."$container_name" bash -c \""$bash_command"\"
}

echo -e "${GREEN}Installing requirements for ${app_name}...${NC}"
run_in_container_venv make requirements

echo -e "${GREEN}Running migrations for ${app_name}...${NC}"
run_in_container_venv make migrate

echo -e "${GREEN}Creating super-user for ${app_name}...${NC}"
run_in_container_venv ./manage.py shell -c \
"from django.contrib.auth import get_user_model; \
User = get_user_model(); \
User.objects.create_superuser('edx', 'edx@example.com', 'edx') \
if not User.objects.filter(username='edx').exists() else None"

./provision-ida-user.sh $app_name $client_name $client_port

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${app_name}...${NC}"
run_in_container_venv make static
