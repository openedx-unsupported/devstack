#!/usr/bin/env bash
set -eu -o pipefail

. scripts/colors.sh
set -x

name=insights
port=18110

docker compose up -d insights

echo -e "${GREEN}Installing requirements for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'source /edx/app/insights/insights_env && cd /edx/app/insights/insights && make develop' -- ${name}

# # Install Insights npm dependencies
docker compose exec -T ${name} bash -e -c 'source /edx/app/insights/insights_env && cd /edx/app/insights/insights/ && npm ci && ./npm-post-install.sh'

echo -e "${GREEN}Running migrations for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'source /edx/app/insights/insights_env && export DJANGO_SETTINGS_MODULE="analytics_dashboard.settings.devstack" && cd /edx/app/insights/insights && make migrate' -- ${name}

./provision-ida-user.sh ${name} ${name} ${port}

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for ${name}...${NC}"
docker compose exec -T ${name}  bash -e -c 'source /edx/app/insights/insights_env && cd /edx/app/insights/insights && make static' -- "$name"
