app_name=$1  # The name of the IDA application, i.e. /edx/app/<app_name>
client_name=$2  # The name of the Oauth client stored in the edxapp DB.
client_port=$3  # The port corresponding to this IDA service in devstack.
app_name_folder=$4
docker_instance=$5

# The name of the subfolder for the application , i.e. /edx/app/<app_name>/<app_name_folder> defaults to
# app_name if not provided. This is because of insights which is in the /edx/app/insights/edx_analytics_dashboard/
if [ -z "$app_name_folder" ]; then
   app_name_folder=$1
fi

# Sometimes, to respect, DNS name convention (https://tools.ietf.org/html/rfc1035) we cannot use the exact same
# docker instance image name as the app name (for example analytics_api that is not valid as a DNS name).
if [ -z "$docker_instance" ]; then
   docker_instance=$1
fi

docker-compose $DOCKER_COMPOSE_FILES up -d $app_name

echo -e "${GREEN}Installing requirements for ${app_name}...${NC}"
docker exec -t edx.devstack.${docker_instance}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$2/ && make requirements' -- "$app_name"  "$app_name_folder"

echo -e "${GREEN}Running migrations for ${app_name}...${NC}"
docker exec -t edx.devstack.${docker_instance}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$2/ && make migrate' -- "$app_name" "$app_name_folder"

echo -e "${GREEN}Creating super-user for ${app_name}...${NC}"
docker exec -t edx.devstack.${docker_instance}  bash -c 'source /edx/app/$1/$1_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\") if not User.objects.filter(username=\"edx\").exists() else None" | python /edx/app/$1/$2/manage.py shell' -- "$app_name" "$app_name_folder"

./provision-ida-user.sh $app_name $client_name $client_port

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${app_name}...${NC}"
docker exec -t edx.devstack.${docker_instance}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$2/ && make static' -- "$app_name" "$app_name_folder"
