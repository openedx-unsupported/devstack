#!/usr/bin/env bash
# Provisioning script for the notes service
set -eu -o pipefail

. scripts/colors.sh
set -x

# Common provisioning tasks for IDAs, including requirements, migrations, oauth client creation, etc.
./provision-ida.sh edx_notes_api edx-notes 18120 edx_notes_api

# This will build the elasticsearch index for notes.
echo -e "${GREEN}Creating indexes for edx_notes_api...${NC}"
docker-compose exec -T edx_notes_api bash -e -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && python manage.py search_index --rebuild -f' -- edx_notes_api
