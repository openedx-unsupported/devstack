#!/usr/bin/env bash

# This script will provision the services specified in the argument list,
# or all services if no arguments are provided.
#
# Non-existant services will be ignored.
# Specifying services more than once will cause them to be provisioned more
# than once.
#
# To allow services to be passed in through a Makefile target,
# services can be plus-sign-separated as well as space separated.
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
#
# Example usages:
# ./provision.sh                          # Provision all services.
# ./provision.sh lms ecommerce discovery  # Provision these three services.
# ./provision.sh lms+ecommerce+discovery  # Same as previous command.

set -e
set -o pipefail
set -u
set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# All provisionable services.
# (Leading and trailing space are necessary for if-checks.)
# The order here is the order we will use when provisioning, even if only a subset
# of services are requested.
# Changing this order may break provisioning.
# For example, Discovery breaks if LMS is not provisioned first.
ALL_SERVICES_IN_ORDER=" \
lms \
ecommerce \
discovery \
credentials \
e2e \
forum \
notes \
registrar \
marketing \
xqueue \
 "

# What should we provision?
if [[ $# -eq 0 ]]; then
	requested_services=$ALL_SERVICES_IN_ORDER
else
	arg_string=" $* "
	# Replace plus signs with spaces in order to allow plus-sign-separated
	# services in addition to space-separated services.
	requested_services="${arg_string//+/ }"
fi

# Returns whether first arg contains second arg as substring.
is_substring() {
	local str="$1"
	local substr="$2"
	if [[ "$str" == *" ${substr} "* ]]; then
		return 0  # Note that '0' means 'success' (i.e., true) in bash.
	else
		return 1
	fi
}

# Returns whether we need to boot mongo,
# based on the space-separated list of services passed in the first argument.
needs_mongo() {
	local services="$1"
	if is_substring "$services" lms || is_substring "$services" forum; then
       	return 0
    else
    	return 1
    fi
}

# Validate user input, building up list of services to provision.
to_provision=" "
for serv in $requested_services; do
	case "$serv" in
		studio)
			echo -e "${YELLOW}Studio is provisioned alongside LMS.\nPass 'lms' as an argument to ensure that Studio is provisioned.${NC}"
			continue
			;;
		edx_notes_api)
			# Treat 'edx_notes_api' as an alias for 'notes'.
			service="notes"
			;;
		*)
			service="$serv"
	esac
	if is_substring "$ALL_SERVICES_IN_ORDER" "$service"; then
		if ! is_substring "$to_provision" "$service"; then
			to_provision="${to_provision}${service} "
		fi
	else
		echo -e "${YELLOW}Service '${service}' either doesn't exist or isn't provisionable.${NC}"
	fi
done

# Order the services based on $ALL_SERVICES_IN_ORDER.
to_provision_ordered=" "
for ordered_service in $ALL_SERVICES_IN_ORDER; do
	if is_substring "$to_provision" "$ordered_service"; then
		to_provision_ordered="${to_provision_ordered}${ordered_service} "
	fi
done

if [[ "$to_provision_ordered" = " " ]]; then
	echo -e "${YELLOW}Nothing to provision; will exit.${NC}"
	exit 0
fi
echo -e "${GREEN}Will provision the following:\n  ${to_provision_ordered}${NC}"

# Bring the databases online.
docker-compose up -d mysql # (temporary until 5.6 is removed)
docker-compose up -d mysql57
if needs_mongo "$to_provision_ordered"; then
	docker-compose up -d mongo
fi

# Temporary until MySQL 5.6 is removed
echo "${GREEN}Waiting for MySQL 5.6.${NC}"
until docker-compose exec -T mysql bash -c "mysql -uroot -se \"SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')\"" &> /dev/null
do
  printf "."
  sleep 1
done

# Ensure the MySQL server is online and usable
echo "${GREEN}Waiting for MySQL 5.7.${NC}"
until docker-compose exec -T mysql57 bash -c "mysql -uroot -se \"SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = 'root')\"" &> /dev/null
do
  printf "."
  sleep 1
done

# In the event of a fresh MySQL container, wait a few seconds for the server to restart
# See https://github.com/docker-library/mysql/issues/245 for why this is necessary.
sleep 20
echo -e "${GREEN}MySQL ready.${NC}"

# Temporary until MySQL 5.6 is removed
echo -e "${GREEN}Ensuring MySQL 5.6 databases and users exist...${NC}"
docker-compose exec -T mysql bash -c "mysql -uroot mysql" < provision.sql

# Ensure that the MySQL databases and users are created for all IDAs.
# (A no-op for databases and users that already exist).
echo -e "${GREEN}Ensuring MySQL 5.7 databases and users exist...${NC}"
docker-compose exec -T mysql57 bash -c "mysql -uroot mysql" < provision.sql

# If necessary, ensure the MongoDB server is online and usable
# and create its users.
if needs_mongo "$to_provision_ordered"; then
	echo -e "${GREEN}Waiting for MongoDB...${NC}"
	# mongo container and mongo process/shell inside the container
	until docker-compose exec -T mongo mongo --eval "db.serverStatus()" &> /dev/null
	do
	  printf "."
	  sleep 1
	done
	echo -e "${GREEN}MongoDB ready.${NC}"
	echo -e "${GREEN}Creating MongoDB users...${NC}"
    docker-compose exec -T mongo bash -c "mongo" < mongo-provision.js
else
	echo -e "${GREEN}MongoDB preparation not required; skipping.${NC}"
fi

# Run the service-specific provisioning script(s)
for service in $to_provision_ordered; do
	echo -e "${GREEN} Provisioning ${service}...${NC}"
	./provision-"$service".sh
	echo -e "${GREEN} Provisioned ${service}.${NC}"
done

docker image prune -f

echo -e "${GREEN}Provisioning complete!${NC}"
