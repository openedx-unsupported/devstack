#!/usr/bin/env bash
set -e
set -o pipefail
set -x

name=credentials
port=18150

docker-compose $DOCKER_COMPOSE_FILES up -d $name

./provision-ida.sh "$name" "$name" "$port" "$name"

echo -e "${GREEN}Configuring site for ${name}...${NC}"
docker exec -t edx.devstack.${name} bash -c 'source /edx/app/credentials/credentials_env && cd /edx/app/credentials/credentials && ./manage.py create_or_update_site --site-id=1 --site-domain=localhost:18150 --site-name="Open edX" --platform-name="Open edX" --company-name="Open edX" --lms-url-root=http://localhost:18000 --catalog-api-url=http://edx.devstack.discovery:18381/api/v1/ --tos-url=http://localhost:18000/tos --privacy-policy-url=http://localhost:18000/privacy --homepage-url=http://localhost:18000 --certificate-help-url=http://localhost:18000/faq --records-help-url=http://localhost:18000/faq --theme-name=openedx'
