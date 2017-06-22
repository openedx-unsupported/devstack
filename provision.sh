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

RED=$(echo -e '\033[0;31m')
GREEN=$(echo -e '\033[0;32m')
YELLOW=$(echo -e '\033[0;33m')
BLUE=$(echo -e '\033[0;34m')
MAGENTA=$(echo -e '\033[0;35m')
NC=$(echo -e '\033[0m') # No Color

# Bring the databases online.
docker-compose up -d mysql mongo memcached

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

./provision-oauth.sh | sed "s/^/${RED}[provision-oauth.sh]${NC} /"

cat <<CMDS | xargs -P 10 -L 1 -I {} bash -c {}
./provision-lms.sh 2>&1 | sed '"s/^/${RED}[provision-lms.sh]${NC} /"'
./provision-studio.sh 2>&1 | sed '"s/^/${GREEN}[provision-studio.sh]${NC} /"'
./provision-ecommerce.sh 2>&1 | sed '"s/^/${YELLOW}[provision-ecommerce.sh]${NC} /"'
./provision-discovery.sh 2>&1 | sed '"s/^/${BLUE}[provision-discovery.sh]${NC} /"'
./provision-credentials.sh 2>&1 | sed '"s/^/${MAGENTA}[provision-credentials.sh]${NC} /"'
CMDS

echo -e "${GREEN}Provisioning complete!${NC}"
