#!/usr/bin/env bash

set -e
set -o pipefail
set -u
set -x

MSG='\033[1;35m' # Bold magenta
NC='\033[0m' # No Color

PROVISION_LMS_SKIP_LOAD_DB="${PROVISION_LMS_SKIP_LOAD_DB:-}"
PROVISION_LMS_SKIP_REQUIREMENTS="${PROVISION_LMS_SKIP_REQUIREMENTS:-}"
PROVISION_LMS_SKIP_MIGRATIONS="${PROVISION_LMS_SKIP_MIGRATIONS:-}"
PROVISION_LMS_SKIP_ASSETS="${PROVISION_LMS_SKIP_ASSETS:-}"
PROVISION_LMS_SKIP_DATA="${PROVISION_LMS_SKIP_DATA:-}"

log(){
	echo -e "$(date +%T) ${MSG}$*${NC}"
}

lms_exec(){
	docker-compose exec -T lms bash -c "source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 $*"
}

lms_django_exec(){
	lms_exec "echo '$1' | python ./manage.py lms shell --settings=devstack_docker"
}

if [[ -z "$PROVISION_LMS_SKIP_LOAD_DB" ]]; then
	log Load database dumps for the largest databases to save time
	./load-db.sh edxapp
	./load-db.sh edxapp_csmh
fi

log Bring up LMS container
docker-compose up -d lms

if [[ -z "$PROVISION_LMS_SKIP_REQUIREMENTS" ]]; then
	log Install dev requirements.
	lms_exec make requirements
fi

if [[ -z "$PROVISION_LMS_SKIP_MIGRATIONS" ]]; then
	log Run edxapp migrations first since they are needed for the service users and OAuth clients
	lms_exec paver update_db --settings devstack_docker
fi

if [[ -z "$PROVISION_LMS_SKIP_ASSETS" ]]; then
	log Fix missing vendor file by clearing the cache
	lms_exec 'rm /edx/app/edxapp/edx-platform/.prereqs_cache/Node_prereqs.sha1'
	log Create static assets
	lms_exec 'paver update_assets --settings devstack_docker lms'
fi

if [[ -z "$PROVISION_LMS_SKIP_DATA" ]]; then
	log Create a superuser for edxapp
	lms_exec python manage.py lms --settings=devstack_docker manage_user edx edx@example.com --superuser --staff
	lms_django_exec "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username=\"edx\"); user.set_password(\"edx\"); user.save()"
	log Create an enterprise service user for edxapp and give them appropriate permissions
	./enterprise/provision.sh
	log Provision a retirement service account user
	./provision-retirement-user.sh retirement retirement_service_worker
	log Enable the LMS-E-Commerce integration
	lms_exec python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker configure_commerce
	log Create demo course and users
	lms_exec /edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook /edx/app/edx_ansible/edx_ansible/playbooks/demo.yml -v -c local -i "127.0.0.1," --extra-vars="COMMON_EDXAPP_SETTINGS=devstack_docker"
	log Add demo program
	./programs/provision.sh lms
fi
