#!/usr/bin/env bash

# This script will provision the services specified in the argument list,
# or all services if 'all' is passed as the *first* argument.
#
# Specifying invalid services will cause the script to exit early.
# Specifying services more than once will cause them to be provisioned more
# than once.
# 
# Service(s) will generally be setup in the following manner
# (but refer to  individual ./provision-{service} scripts to be sure):
# 1. Migrations run,
# 2. Tenants—as in multi-tenancy—setup,
# 3. Service users and OAuth clients setup in LMS,
# 4. Static assets compiled/collected.
#
# DEVSTACK DEVELOPERS -- To add a service to provisioning:
#   * Create a provision-{service}.sh script for your new service.
#   * Add the name of the service to ALL_SERVICES.


set -e
set -o pipefail
set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Leading and trailing space are necessary for if-checks.
ALL_SERVICES=" lms ecommerce discovery credentials e2e forum notes registrar "
if [[ $# -eq 0 ]]; then
	echo -e "${YELLOW}No services specified; nothing to provision. Exiting.${NC}"
	exit 0
else
	if [[ "$1" == "all" ]]; then
		to_provision=$ALL_SERVICES
	else
		to_provision=" $@ "
	fi
fi

# Check whether user requested that certain service be provisioned.
provisioning_requested(){
	if [[ $to_provision == *" $1 "* ]]; then
		return 0
	else
		return 1
	fi
}

# Validate user input.
for service in $to_provision
do
	if [[ $ALL_SERVICES == *" $service "* ]]; then
		echo -e "${GREEN}Will provision: ${service}.${NC}"
	else
		case $service in
			edx_notes_api|notes)
				# Both 'edx_notes_api' and 'notes' are referenced in devstack;
				# handle both.
				echo -e "${GREEN}Will provision: edx_notes_api.${NC}"
				;;
			studio)
				echo -e "${YELLOW}Studio is provisioned alongside LMS.${NC}"
				echo -e "${YELLOW}Pass 'lms' as an argument to ensure that Studio is provisioned.${NC}"
				;;
			*)
				echo -e "${RED}Service '${service}' either doesn't exist or isn't provisionable. Exiting.${NC}"
				exit 1
		esac
	fi
done

# Bring the databases online.
docker-compose up -d mysql mongo

# Ensure the MySQL server is online and usable
echo "${GREEN}Waiting for MySQL.${NC}"
until docker exec -i edx.devstack.mysql mysql -uroot -se "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')" &> /dev/null
do
  printf "."
  sleep 1
done

# In the event of a fresh MySQL container, wait a few seconds for the server to restart
# See https://github.com/docker-library/mysql/issues/245 for why this is necessary.
sleep 20
echo -e "${GREEN}MySQL ready.${NC}"

# Ensure that the MySQL databases and users are created for all IDAs.
# (A no-op for databases and users that already exist).
echo -e "${GREEN}Ensuring MySQL databases and users exist...${NC}"
docker exec -i edx.devstack.mysql mysql -uroot mysql < provision.sql

# If necessary, ensure the MongoDB server is online and usable
# and create its users.
if provisioning_requested lms || provisioning_requested studio || provisioning_requested forum; then
	echo -e "${GREEN}Waiting for MongoDB...${NC}"
	until docker exec -i edx.devstack.mongo mongo --eval "printjson(db.serverStatus())" &> /dev/null
	do
	  printf "."
	  sleep 1
	done
	echo -e "${GREEN}MongoDB ready.${NC}"
	echo -e "${GREEN}Creating MongoDB users...${NC}"
	docker exec -i edx.devstack.mongo mongo < mongo-provision.js
else
	echo -e "${GREEN}MongoDB preparation not required; skipping.${NC}"
fi

# Run the service-specific provisioning script(s)
for serv in $to_provision; do
	case $serv in
		studio)        continue      ;;
		edx_notes_api) service=notes ;;
		*)             service=$serv
	esac

	echo -e "${GREEN} Provisioning ${service}...${NC}"
	./provision-${service}.sh
	echo -e "${GREEN} Provisioned ${service}.${NC}"
done

docker image prune -f

echo -e "${GREEN}Provisioning complete!${NC}"
