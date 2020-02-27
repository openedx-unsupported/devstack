#!/usr/bin/env bash

set -e
set -o pipefail
set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

if [ -z "$DEVSTACK_WORKSPACE" ]; then
    DEVSTACK_WORKSPACE=..
elif [ ! -d "$DEVSTACK_WORKSPACE" ]; then
    echo "Workspace directory $DEVSTACK_WORKSPACE doesn't exist"
    exit 1
fi

# Bring the mysql & insights online.
docker-compose $DOCKER_COMPOSE_FILES up -d insights

# Ensure the MySQL server is online and usable
echo "Waiting for MySQL"
until docker exec -i edx.devstack.mysql mysql -uroot -se "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')" &> /dev/null
do
  printf "."
  sleep 1
done

echo -e "${GREEN}Ensuring MySQL databases and users exist...${NC}"
docker-compose exec -T mysql bash -c "mysql -uroot mysql" < provision.sql

# Migrate databases
docker-compose  $DOCKER_COMPOSE_FILES exec -T analyticsapi bash -c "
	source /edx/app/analytics_api/analytics_api_env &&
	source /edx/app/analytics_api/venvs/analytics_api/bin/activate &&
	cd /edx/app/analytics_api/analytics_api &&
       	make migrate-all loaddata"

docker-compose  $DOCKER_COMPOSE_FILES exec -T insights make -C /edx/app/insights/edx_analytics_dashboard/ migrate

# Install Insights npm dependencies
docker-compose  $DOCKER_COMPOSE_FILES exec -T insights_frontend bash -c 'cd /edx/app/insights/edx_analytics_dashboard/ && npm install && ./npm-post-install.sh'

docker-compose  $DOCKER_COMPOSE_FILES exec -T insights bash -c 'source /edx/app/insights/insights_env && source /edx/app/insights/venvs/insights/bin/activate &&
								cd /edx/app/insights/edx_analytics_dashboard/ && 
								python manage.py collectstatic --settings analytics_dashboard.settings.devstack \
								--noinput --verbosity 0'
