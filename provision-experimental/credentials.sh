#!/usr/bin/env bash
set -xeuo pipefail
. scripts/colors.sh

# Depends on LMS and Credentials being up.

docker-compose up -d credentials

echo -e "${GREEN}Installing requirements for credentials...${NC}"
docker-compose exec -T credentials bash -e -c 'make requirements'

echo -e "${GREEN}Running migrations for credentials...${NC}"
docker-compose exec -T credentials bash -e -c 'make migrate'

echo -e "${GREEN}Creating super-user for credentials...${NC}"
docker-compose exec -T credentials bash -e -c \
	"echo \"from django.contrib.auth import get_user_model; User = get_user_model(); \
	 User.objects.create_superuser('edx', 'edx@example.com', 'edx') \
	 if not User.objects.filter(username='edx').exists() else None\" \
	 | python ./manage.py shell"

echo -e "${GREEN}Configuring site for credentials...${NC}"
docker-compose exec -T credentials bash -e -c \
	"./manage.py create_or_update_site \
		--site-id=1 \
		--site-domain=localhost:18150 \
		--site-name='Open edX' \
		--platform-name='Open edX' \
		--company-name='Open edX' \
		--lms-url-root=http://localhost:18000 \
		--catalog-api-url=http://edx.devstack.discovery:18381/api/v1/ \
		--tos-url=http://localhost:18000/tos \
		--privacy-policy-url=http://localhost:18000/privacy \
		--homepage-url=http://localhost:18000 \
		--certificate-help-url=http://localhost:18000/faq \
		--records-help-url=http://localhost:18000/faq \
		--theme-name=openedx"

./provision-experimental/lms-service-users.sh credentials 18150

# Compile static assets last since they aren't absolutely necessary for all services. This will allow developers to get
# started if they do not care about static assets	
echo -e "${GREEN}Compiling static assets for credentials...${NC}"
docker-compose exec -T credentials bash -e -c \
	"if ! make static 2>creds_make_static.err ; then \
		echo '------- Last 100 lines of stderr'; tail creds_make_static.err -n 100; echo '-------'; \
	fi;"

# Restart credentials devserver.
make dev.restart-devserver.credentials
