#!/usr/bin/env bash
# Provisioning script for the notes service
set -eu -o pipefail

. scripts/colors.sh
set -x

name=edx_notes_api
port=18734
client_name=edx-notes  # The name of the Oauth client stored in the edxapp DB.

docker compose up -d $name

echo -e "${GREEN}Installing requirements for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'cd /edx/app/notes && make requirements' -- "$name"

echo -e "${GREEN}Running migrations for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'cd /edx/app/notes && make migrate' -- "$name"

echo -e "${GREEN}Creating super-user for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'cho "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\") if not User.objects.filter(username=\"edx\").exists() else None" | python /edx/app/notes/manage.py shell' -- "$name"

./provision-ida-user.sh $name $client_name $port

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'cd /edx/app/notes && make static' -- "$name"

# This will build the elasticsearch index for notes.
echo -e "${GREEN}Creating indexes for ${name}...${NC}"
docker compose exec -T ${name} bash -e -c 'cd /edx/app/notes/ && python manage.py search_index --rebuild -f'
