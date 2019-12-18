#!/usr/bin/env bash

# This script will provision the service specified in the first argument,
# or all services if 'all' is passed as the argument.
# 
# Service(s) will generally be setup in the following manner
# (but refer to  individual ./provision-{service} scripts to be sure):
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

if [[ $# -ne 1 ]]; then
	echo -e "${RED}Exactly one argument required: Name of service or 'all'.\n\
	Example 1: ./provision.sh discovery\n\
	Example 2: ./provision.sh all${NC}"
	exit 1
fi

service=$1
case $service in
	all)
		echo -e "${GREEN}Will provision all services.${NC}"
		service=""
		;;
	lms|ecommerce|discovery|credentials|e2e|forum|notes|registrar)
		echo -e "${GREEN}Will provision one service: ${service}.${NC}"
		;;
	studio)
		echo -e "${YELLOW}Studio is provisioned along with LMS; try running './provision.sh lms'${NC}"
		exit 0
		;;
	*)
		echo -e "${YELLOW}Service '${service}' either doesn't exist or isn't provisionable. Exiting.${NC}"
		exit 1
esac		

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
# See https://github.com/docker-library/mysql/issues/245 for why this is necessary.
sleep 20
echo -e "MySQL ready"

# Ensure that the MySQL databases and users are created for all IDAs.
# (A no-op for databases and users that already exist).
echo -e "${GREEN}Ensuring MySQL databases and users exist...${NC}"
docker exec -i edx.devstack.mysql mysql -uroot mysql < provision.sql

# If necessary, ensure the MongoDB server is online and usable
# and create its users.
case $service in
	"lms"|"studio"|"forum"|"")
		echo "Waiting for MongoDB"
		until docker exec -i edx.devstack.mongo mongo --eval "printjson(db.serverStatus())" &> /dev/null
		do
		  printf "."
		  sleep 1
		done
		echo -e "MongoDB ready"
		echo -e "${GREEN}Creating MongoDB users...${NC}"
		docker exec -i edx.devstack.mongo mongo < mongo-provision.js
		;;
	*)
		echo -e "${GREEN}MongoDB preparation not required; skipping.${NC}"
esac

# Run the service-specific provisioning script(s)
for serv in ${service:-lms ecommerce discovery credentials e2e forum notes registrar}; do
	echo -e "${GREEN} Provisioning ${serv}...${NC}"
	./provision-${serv}.sh
done

docker image prune -f

echo -e "${GREEN}Provisioning complete!${NC}"
