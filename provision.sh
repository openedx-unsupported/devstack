#!/usr/bin/env bash

# This script will provision all of the services. Each service will be setup in the following manner:
#
# 1. Migrations run,
# 2. Tenants—as in multi-tenancy—setup,
# 3. Service users and OAuth clients setup in LMS,
# 4. Static assets compiled/collected.


set -e
set -o pipefail
set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Bring the databases online.
docker-compose up -d mysql mongo

# Ensure the MySQL server is online and usable
echo "Waiting for MySQL"
until docker exec -i edx.devstack.mysql mysql -uroot -se "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')" &> /dev/null
do
  printf "."
  sleep 1
done

# In the event of a fresh MySQL container, wait a few seconds for the server to restart
# This can be removed once https://github.com/docker-library/mysql/issues/245 is resolved.
sleep 20

echo -e "MySQL ready"

echo -e "${GREEN}Creating databases and users...${NC}"
docker exec -i edx.devstack.mysql mysql -uroot mysql < provision.sql
docker exec -i edx.devstack.mongo mongo < mongo-provision.js

df -h
./provision-lms.sh

# Nothing special needed for studio
df -h
docker-compose $DOCKER_COMPOSE_FILES up -d studio
df -h
./provision-ecommerce.sh
df -h
./provision-discovery.sh
df -h
./provision-credentials.sh
df -h
./provision-e2e.sh
df -h
./provision-forum.sh
df -h

docker image prune -f

echo -e "${GREEN}Provisioning complete!${NC}"
