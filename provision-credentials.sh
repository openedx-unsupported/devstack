#!/usr/bin/env bash

# NOTE (CCB): We do NOT call provision-ida because it expects a virtualenv.
# The new images for Credentials do not use virtualenv.

name=credentials
port=18150

docker-compose $DOCKER_COMPOSE_FILES up -d $name

echo -e "${GREEN}Installing requirements for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'make requirements' -- "$name"

echo -e "${GREEN}Running migrations for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'make migrate' -- "$name"

echo -e "${GREEN}Creating super-user for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\") if not User.objects.filter(username=\"edx\").exists() else None" | python /edx/app/$1/$1/manage.py shell' -- "$name"

# TODO Create credentials tenant (ECOM-6566)

./provision-ida-user.sh ${name} ${port}

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c ' make static' -- "$name"
