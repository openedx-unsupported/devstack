#!/usr/bin/env bash
set -eu -o pipefail

. scripts/colors.sh
set -x

# Pulling the image will almost always be a no-op, but will be important
# when we bump the version in docker-compose.yml or when Neo4j releases a patch.
# Also, this gives us a chance to refresh the container in case it's gotten into
# a weird state.
echo -e "${GREEN}   Ensuring Coursegraph image is up to date...${NC}"
docker compose rm --force --stop coursegraph
docker compose pull coursegraph

echo -e "${GREEN}   Starting Coursegraph and CMS...${NC}"
docker compose up -d coursegraph cms
sleep 10  # Give Neo4j some time to boot up.

echo -e "${GREEN}   Updating CMS courses in Coursegraph...${NC}"
docker compose exec cms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && ./manage.py cms dump_to_neo4j --host coursegraph.devstack.edx --user neo4j --password edx'

echo -e "${GREEN}   Coursegraph is now up-to-date with CMS!${NC}"
