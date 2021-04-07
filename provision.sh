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
source .env

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

if [ "$MOUNT_TYPE" = "-nfs" ]; then
  ./setup_native_nfs_docker_osx.sh
fi

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
sleep 10

echo -e "MySQL ready"

if $ENABLE_EDX; then
  ./provision-lms.sh
  # Nothing special needed for studio
  docker-compose `echo ${DOCKER_COMPOSE_FILES}` up -d studio
fi


if $ENABLE_PROGS; then

  echo "** Programs **"
  ./provision-progs.sh
fi

if $ENABLE_B2B; then

  echo "** B2B **"
  ./provision-b2b.sh
fi

if $ENABLE_MKTG; then
  echo "** Marketing **"
  ./provision-mktg.sh
fi

if $ENABLE_STATE_MANAGER; then
  echo "** State Manager **"
  ./provision-state-manager-api.sh
fi

docker image prune -f

echo -e "${GREEN}Provisioning complete!${NC}"
