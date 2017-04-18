start-mongo:
	docker-compose up -d mongo
	sleep 20

start-mysql:
	docker-compose up -d mysql
	./wait-for-mysql.sh

provision-mongo: start-mongo
	docker exec -i edx.devstack.mongo mongo < mongo-provision.js

provision-mysql: start-mysql
	docker exec -i edx.devstack.mysql mysql -uroot mysql < provision.sql

lms-load-main: provision-mysql
	./load-db.sh edxapp

lms-load-csmh: provision-mysql
	./load-db.sh edxapp_csmh

lms-load-db: lms-load-main lms-load-csmh

lms-start: lms-load-db
	docker-sync-daemon start
	docker-compose -f docker-compose.yml -f docker-compose-host.yml up -d lms

lms-install-prereqs: lms-start
	docker-compose exec lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver install_prereqs'

lms-collectstatic: lms-install-prereqs
	docker-compose exec lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && paver update_assets --settings devstack_docker'

lms-update-db: lms-install-prereqs
	# Run edxapp migrations first since they are needed for the service users and OAuth clients
	docker-compose exec lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && NO_PREREQ_INSTALL=1 paver update_db --settings devstack_docker'
	docker-compose restart lms

lms-install-demo-course: provision-mongo lms-update-db lms-install-prereqs
	docker-compose exec lms bash -c '/edx/app/edx_ansible/venvs/edx_ansible/bin/ansible-playbook /edx/app/edx_ansible/edx_ansible/playbooks/edx-east/demo.yml -v -c local -i "127.0.0.1," --extra-vars="COMMON_EDXAPP_SETTINGS=devstack_docker"'

lms-setup-service-users: lms-update-db
	# Create a superuser for edxapp
	docker-compose exec lms bash -c 'source /edx/app/edxapp/edxapp_env && python /edx/app/edxapp/edx-platform/manage.py lms --settings=devstack_docker manage_user edx edx@example.com --superuser --staff'
	docker-compose exec lms bash -c 'source /edx/app/edxapp/edxapp_env && echo "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username=\"edx\"); user.set_password(\"edx\"); user.save()" | python /edx/app/edxapp/edx-platform/manage.py lms shell  --settings=devstack_docker'

provision-lms: lms-collectstatic lms-install-demo-course lms-setup-service-users

provision-all: provision-lms provision-credentials provision-ecommerce provision-discovery
