#!/usr/bin/env bash

name=registrar
port=18734

docker-compose $DOCKER_COMPOSE_FILES up -d $name

echo -e "${GREEN}Installing requirements for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'source /edx/app/registrar/registrar_env && cd /edx/app/registrar/registrar && make requirements && make production-requirements' -- "$name"

echo -e "${GREEN}Running migrations for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'source /edx/app/registrar/registrar_env && cd /edx/app/registrar/registrar && make migrate' -- "$name"

echo -e "${GREEN}Creating super-user for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c 'source /edx/app/registrar/registrar_env && cd /edx/app/registrar/registrar && make create_superuser' -- "$name"

./provision-ida-user.sh ${name} ${name} ${port}

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${name}...${NC}"
docker exec -t edx.devstack.${name}  bash -c ' if ! source /edx/app/registrar/registrar_env && cd /edx/app/registrar/registrar && make static 2>creds_make_static.err; then echo "------- Last 100 lines of stderr"; tail creds_make_static.err -n 100; echo "-------"; fi;' -- "$name"
