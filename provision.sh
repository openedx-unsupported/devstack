#!/usr/bin/env bash

# Ensure the containers are started
docker-compose up -d

# Create the databases and users
docker exec -i edx.devstack.mysql mysql -uroot < provision.sql

# Create superusers that can access the services without the need for single sign-on
# NOTE: If the users already exist, errors will be raised (in the Django shell), but execution of this provisioning
# script will continue.
services=('credentials' 'discovery' 'ecommerce' 'programs')
for service in "${services[@]}"
do
	docker exec -t edx.devstack.${service}  bash -c 'source /edx/app/$1/$1_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\")" | python /edx/app/$1/$1/manage.py shell' -- "$service"
done


# TODO Create ecommerce tenant (ECOM-6564)
# Use create_or_update_site (https://github.com/edx/ecommerce/blob/master/ecommerce/core/management/commands/create_or_update_site.py)

# TODO Create discovery tenant with correct credentials (ECOM-6565)
docker exec -t edx.devstack.discovery bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py create_or_update_partner --code edx --name edX --courses-api-url "https://courses.edx.org/api/courses/v1/" --ecommerce-api-url "http://edx.devstack.ecommerce/api/v2/" --organizations-api-url "https://courses.edx.org/api/organizations/v0/" --programs-api-url "http://edx.devstack.programs/api/v1/" --marketing-site-url-root "http://edx.devstack.marketing-site/" --marketing-site-api-url "http://edx.devstack.marketing-site/api/catalog/v2/" --marketing-site-api-username coursediscoveryworker --marketing-site-api-password "edx" --oidc-url-root "https://courses.edx.org/oauth2" --oidc-key discovery-key --oidc-secret discovery-secret'

# TODO Create credentials tenant (ECOM-6566)
