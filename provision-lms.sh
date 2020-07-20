#!/usr/bin/env bash

set -e
set -o pipefail
set -u
set -x

MSG='\033[1;35m' # Bold magenta
NC='\033[0m' # No Color

log(){
	echo -e "${MSG}<<<$(date +%T)>>> $*${NC}"
}

lms_exec(){
	docker-compose exec -T lms bash -c "source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 $*"
}

lms_django_exec(){
	lms_exec "echo '$1' | python ./manage.py lms shell --settings=devstack_docker"
}

if [[ "$PROVISION_LOAD_DUMPS" == "true" ]]; then
	log "Load database dumps to save time during migrations."
	./load-db.sh edxapp
	./load-db.sh edxapp_csmh
fi

if [[ "$PROVISION_PULL_IMAGES" == "true" ]]; then
	log "Pull latest images (which includes latest requirements)."
	docker-compose pull lms
fi

log "Bring up LMS container."
docker-compose up -d lms

if [[ "$PROVISION_RUN_MIGRATIONS" == "true" ]]; then
	log "Run LMS migrations."
	# Run them first since they are needed for the service users and OAuth clients
	make dev.migrate.lms
fi

if [[ "$PROVISION_COMPILE_ASSETS" == "true" ]]; then
	log "Compile static assets."
	# "Fix missing vendor file by clearing the cache"
	lms_exec 'rm /edx/app/edxapp/edx-platform/.prereqs_cache/Node_prereqs.sha1'
	# "Create static assets"
	make dev.static.lms
fi

if [[ "$PROVISION_CREATE_USERS" == "true" ]]; then
	log "Creating service users and configuring integrations."
	# Create a superuser for edxapp
	lms_exec python manage.py lms --settings=devstack_docker manage_user edx edx@example.com --superuser --staff
	lms_django_exec "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username=\"edx\"); user.set_password(\"edx\"); user.save()"
	# Create an enterprise service user for edxapp and give them appropriate permissions
	./enterprise/provision.sh
	# Provision a retirement service account user
	./provision-retirement-user.sh retirement retirement_service_worker
	# Enable the LMS-E-Commerce integration
	lms_exec python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker configure_commerce
fi

if [[ "$PROVISION_CREATE_DEMO_DATA" == "true" ]]; then
	log "Create demo course and users and adding a demo program."
	lms_exec /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook /edx/app/edx_ansible/edx_ansible/playbooks/demo.yml -v -c local -i "127.0.0.1," --extra-vars="COMMON_EDXAPP_SETTINGS=devstack_docker"
	./programs/provision.sh lms
fi
