# Here we have to tweak a bit the script as the default images for insights and analytics_api are not standard (i.e. some settings are missing or folder layout wrong)


# Bring the databases online.
docker-compose up -d mysql

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


## Create the databases
echo -e "${GREEN}Creating databases and users for analytics (insights / analytics_api)...${NC}"
docker exec -i edx.devstack.mysql mysql -uroot mysql < provision-insights.sql

## Start the analytics infra
#docker-compose $DOCKER_COMPOSE_FILES up -d insights
#
### Setup the right auth Token to SSO in edX
#docker cp insights/ansible_overrides_insights.yml edx.devstack.insights:/tmp/
#
## Here this is a bit of a hack, instead of rebuilding a new docker image (which should be the right way), we hack the edxops one
#docker exec -t edx.devstack.insights bash -c 'ANSIBLE_CONFIG=/edx/app/edx_ansible/edx_ansible/docker/plays/ansible.cfg /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook /edx/app/edx_ansible/edx_ansible/docker/plays/insights.yml \
#        -v -c local -i "127.0.0.1,"  -t "install:base,install:system-requirements,install:configuration,install:app-requirements" \
#        --extra-vars="INSIGHTS_VERSION=${OPENEDX_RELEASE}" \
#        --extra-vars="@/edx/app/edx_ansible/edx_ansible/docker/build/insights/ansible_overrides.yml" \
#        --extra-vars="@/edx/app/edx_ansible/edx_ansible/docker/build/devstack/ansible_overrides.yml" \
#        --extra-vars="@/tmp/ansible_overrides_insights.yml"'

## Start the analytics_api infra
#docker-compose $DOCKER_COMPOSE_FILES up -d analytics_api
##
#docker cp insights/ansible_overrides_analytics_api.yml edx.devstack.analytics_api:/tmp/
##
#docker exec -t edx.devstack.analytics_api bash -c 'ANSIBLE_CONFIG=/edx/app/edx_ansible/edx_ansible/docker/plays/ansible.cfg /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook /edx/app/edx_ansible/edx_ansible/docker/plays/analytics_api.yml \
#        -v -c local -i "127.0.0.1,"  -t "install:base,install:system-requirements,install:configuration,install:app-requirements" \
#        --extra-vars="ANALYTICS_API_VERSION=${OPENEDX_RELEASE}"   \
#        --extra-vars="@/edx/app/edx_ansible/edx_ansible/docker/build/analytics_api/ansible_overrides.yml" \
#        --extra-vars="@/edx/app/edx_ansible/edx_ansible/docker/build/devstack/ansible_overrides.yml" \
#        --extra-vars="@/tmp/ansible_overrides_analytics_api.yml"'


# Then do the normal provisionning
./provision-ida.sh insights insights 18110 edx_analytics_dashboard
./provision-ida.sh analytics_api analytics_api 18180 analytics_api analyticsapi

# Setup the analytics API user
docker exec -t edx.devstack.analyticsapi  bash -c "/edx/app/analytics_api/venvs/analytics_api/bin/python  /edx/app/analytics_api/analytics_api/manage.py set_api_key dummy-api-user dataapitoken"
# Run migrations for analytics API
docker exec -t edx.devstack.analyticsapi  bash -c "/edx/app/analytics_api/venvs/analytics_api/bin/python  /edx/app/analytics_api/analytics_api/manage.py migrate --noinput --run-syncdb --database=analytics --settings analyticsdataserver.settings.local"
docker exec -t edx.devstack.analyticsapi  bash -c "/edx/app/analytics_api/venvs/analytics_api/bin/python  /edx/app/analytics_api/analytics_api/manage.py migrate --noinput --run-syncdb --database=default --settings analyticsdataserver.settings.local"

# Generate fake data for the demo course
# Note that for now the Analytics API is not connected to the backend
docker exec -t edx.devstack.analyticsapi  bash -c "/edx/app/analytics_api/venvs/analytics_api/bin/python  /edx/app/analytics_api/analytics_api/manage.py generate_fake_course_data --num-week=2 --no-videos --course-id='course-v1:edX+DemoX+Demo_Course' --settings analyticsdataserver.settings.local"
