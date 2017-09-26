# Provisioning script for the discovery service
./provision-ida.sh discovery 18381

docker-compose exec discovery bash -c 'rm -rf /edx/var/discovery/*'
docker-compose exec discovery bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py create_or_update_partner --site-id 1 --site-domain localhost:18381 --code edx --name edX --courses-api-url "http://edx.devstack.lms:18000/api/courses/v1/" --ecommerce-api-url "http://edx.devstack.ecommerce:18130/api/v2/" --organizations-api-url "http://edx.devstack.lms:18000/api/organizations/v0/" --oidc-url-root "http://edx.devstack.lms:18000/oauth2" --oidc-key discovery-key --oidc-secret discovery-secret'
docker-compose exec discovery bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py refresh_course_metadata'
docker-compose exec discovery bash -c 'source /edx/app/discovery/discovery_env && python /edx/app/discovery/discovery/manage.py update_index --disable-change-limit'
