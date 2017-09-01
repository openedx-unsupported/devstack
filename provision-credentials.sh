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

echo -e "${GREEN}Configuring site for ${name}...${NC}"
docker exec -t edx.devstack.${name} bash -c './manage.py create_or_update_site --site-id=1 --site-domain=localhost:18150 --site-name="Open edX" --platform-name="Open edX" --company-name="Open edX" --lms-url-root=http://localhost:18000 --catalog-api-url=http://edx.devstack.discovery:18381/api/v1/ --tos-url=http://localhost:18000/tos --privacy-policy-url=http://localhost:18000/privacy --homepage-url=http://localhost:18000 --certificate-help-url=http://localhost:18000/faq --theme-name=openedx'

./provision-ida-user.sh ${name} ${port}

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c ' make static' -- "$name"
