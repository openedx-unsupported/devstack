#!/usr/bin/env bash
set -eu -o pipefail

. scripts/colors.sh
set -x

name=analyticsapi
port=19001

docker compose up -d ${name}

echo -e "${GREEN}Installing requirements for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'source /edx/app/analytics_api/analytics_api_env && cd /edx/app/analytics_api/analytics_api && make develop' -- ${name}

echo -e "${GREEN}Running migrations for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'source /edx/app/analytics_api/analytics_api_env && export DJANGO_SETTINGS_MODULE="analyticsdataserver.settings.devstack" && cd /edx/app/analytics_api/analytics_api && make migrate-all' -- ${name}

echo -e "${GREEN}Creating default user and authentication token for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'source /edx/app/analytics_api/analytics_api_env && cd /edx/app/analytics_api/analytics_api && python manage.py set_api_key edx edx' -- ${name}

echo -e "${GREEN}Loading test data for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'source /edx/app/analytics_api/analytics_api_env && cd /edx/app/analytics_api/analytics_api && make loaddata' -- ${name}
