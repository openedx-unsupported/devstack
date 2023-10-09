#!/usr/bin/env bash
set -eu -o pipefail

. scripts/colors.sh
set -x

name=registrar
port=18734

docker compose up -d $name

echo -e "${GREEN}Installing requirements for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'cd /edx/app/registrar && make requirements' -- "$name"

echo -e "${GREEN}Running migrations for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'cd /edx/app/registrar && make migrate' -- "$name"

echo -e "${GREEN}Creating super-user for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'cd /edx/app/registrar && make createsuperuser' -- "$name"

./provision-ida-user.sh ${name} ${name} ${port}

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c ' if ! cd /edx/app/registrar && make static 2>registrar_make_static.err; then echo "------- Last 100 lines of stderr"; tail regsitrar_make_static.err -n 100; echo "-------"; fi;' -- "$name"
