name=$1
port=$2

docker-compose $DOCKER_COMPOSE_FILES up -d $name

echo -e "${GREEN}Installing requirements for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make requirements' -- "$name"

echo -e "${GREEN}Running migrations for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make migrate' -- "$name"

echo -e "${GREEN}Creating super-user for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'source /edx/app/$1/$1_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\") if not User.objects.filter(username=\"edx\").exists() else None" | python /edx/app/$1/$1/manage.py shell' -- "$name"

./provision-ida-user.sh $name $port

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make static' -- "$name"
