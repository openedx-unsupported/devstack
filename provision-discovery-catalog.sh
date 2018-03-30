# Provisioning script for the discovery-catalog service
docker-compose $DOCKER_COMPOSE_FILES up -d discovery-catalog

echo -e "${GREEN}Installing requirements for discovery-catalog...${NC}"
docker exec -t edx.devstack.discovery-catalog  bash -c 'source /edx/app/discovery/discovery_env && cd /edx/app/discovery/discovery/ && make requirements' -- "$name"

echo -e "${GREEN}Running migrations for discovery-catalog...${NC}"
docker exec -t edx.devstack.discovery-catalog  bash -c 'source /edx/app/discovery/discovery_env && cd /edx/app/discovery/discovery/ && make migrate' -- "$name"

echo -e "${GREEN}Creating super-user for discovery-catalog...${NC}"
docker exec -t edx.devstack.discovery-catalog  bash -c 'source /edx/app/discovery/discovery_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser(\"edx\", \"edx@example.com\", \"edx\") if not User.objects.filter(username=\"edx\").exists() else None" | python /edx/app/discovery/discovery/manage.py shell' -- "$name"

./provision-ida-user.sh $name $port

# Compile static assets last since they are absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets
echo -e "${GREEN}Compiling static assets for discovery-catalog...${NC}"
docker exec -t edx.devstack.discovery-catalog  bash -c 'source /edx/app/discovery/discovery_env && cd /edx/app/discovery/discovery/ && make static' -- "$name"


docker-compose exec discovery-catalog bash -c 'rm -rf /edx/var/discovery/*'
docker-compose exec discovery-catalog bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py create_or_update_partner --site-id 1 --site-domain localhost:18382 --code edx --name edX --courses-api-url "http://edx.devstack.lms:18000/api/courses/v1/" --ecommerce-api-url "http://edx.devstack.ecommerce:18130/api/v2/" --organizations-api-url "http://edx.devstack.lms:18000/api/organizations/v0/" --oidc-url-root "http://edx.devstack.lms:18000/oauth2" --oidc-key discovery-catalog-key --oidc-secret discovery-catalog-secret'
docker-compose exec discovery-catalog bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py refresh_course_metadata'
docker-compose exec discovery-catalog bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py update_index --disable-change-limit'
