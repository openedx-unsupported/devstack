#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# Bring the database online.
docker-compose up -d mysql

n=0
db_limit=5
db_sleep_time=2
until [ $n -ge $db_limit ]
do
  docker exec -i edx.devstack.mysql mysql -uroot < provision.sql && echo -e "${GREEN}Service databases and users have been created.${NC}" && break
  n=$[$n+1]
  echo -e "${YELLOW}Waiting ${db_sleep_time} seconds for MySQL to come online...${NC}"
  sleep 2
done

if [ $n -ge $db_limit ]
    then
        echo -e "${RED}Failed to create service databases and users!${NC}"
        exit 1
fi

# Bring the rest of the services online
docker-compose up -d

# Run migrations, and create superusers that can access the services without the need for single sign-on.
services=('credentials' 'discovery' 'ecommerce' 'programs')
for service in "${services[@]}"
do
    echo -e "${GREEN}Running migrations for ${service}...${NC}"
    docker exec -t edx.devstack.${service}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make migrate' -- "$service"
    echo -e "${GREEN}Creating super-user for ${service}...${NC}"
	docker exec -t edx.devstack.${service}  bash -c 'source /edx/app/$1/$1_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\") if not User.objects.filter(username=\"edx\").exists() else None" | python /edx/app/$1/$1/manage.py shell' -- "$service"
done


# TODO Create ecommerce tenant (ECOM-6564)
# Use create_or_update_site (https://github.com/edx/ecommerce/blob/master/ecommerce/core/management/commands/create_or_update_site.py)
docker exec -t edx.devstack.ecommerce bash -c 'source /edx/app/ecommerce/ecommerce_env && python /edx/app/ecommerce/ecommerce/manage.py oscar_populate_countries'

# TODO Create discovery tenant with correct credentials (ECOM-6565)
docker exec -t edx.devstack.discovery bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py create_or_update_partner --code edx --name edX --courses-api-url "http://edx.devstack.edxapp:18000/api/courses/v1/" --ecommerce-api-url "http://edx.devstack.ecommerce:18130/api/v2/" --organizations-api-url "http://edx.devstack.edxapp:18000/api/organizations/v0/" --programs-api-url "http://edx.devstack.programs:18140/api/v1/" --oidc-url-root "http://edx.devstack.edxapp:18000/oauth2" --oidc-key discovery-key --oidc-secret discovery-secret' &

# TODO Create credentials tenant (ECOM-6566)

# Compile static assets. We do this last since it takes the longest.
# NOTE: Programs has no static assets.
services=('credentials' 'discovery' 'ecommerce')
for service in "${services[@]}"
do
    echo -e "${GREEN}Compiling static assets for ${service}...${NC}"
	docker exec -t edx.devstack.${service}  bash -c 'source /edx/app/$1/$1_env && cd /edx/app/$1/$1/ && make static' -- "$service"
done

echo -e "${GREEN}Provisioning complete!${NC}"
