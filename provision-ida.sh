app_name=$1  # The name of the IDA application, i.e. /edx/app/<app_name>
client_name=$2  # The name of the Oauth client stored in the edxapp DB.
client_port=$3  # The port corresponding to this IDA service in devstack.

docker-compose $DOCKER_COMPOSE_FILES up -d $app_name

echo -e "${GREEN}Installing requirements for ${app_name}...${NC}"
docker exec -t b2b.devstack.${app_name}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make requirements' -- "$app_name"

echo -e "${GREEN}Running migrations for ${app_name}...${NC}"
docker exec -t b2b.devstack.${app_name}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make migrate' -- "$app_name"

echo -e "${GREEN}Creating super-user for ${app_name}...${NC}"
docker exec -t b2b.devstack.${app_name}  bash -c 'source /edx/app/$1/$1_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\") if not User.objects.filter(username=\"edx\").exists() else None" | python /edx/app/$1/$1/manage.py shell' -- "$app_name"

./provision-ida-user.sh $app_name $client_name $client_port

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${app_name}...${NC}"
docker exec -t b2b.devstack.${app_name}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make static' -- "$app_name"
