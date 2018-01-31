########################################################################################################################
#
# When adding a new target:
#   - If you are adding a new service make sure the dev.reset target will fully reset said service.
#
########################################################################################################################
.DEFAULT_GOAL := help

DEVSTACK_WORKSPACE ?= $(shell pwd)/..

OS := $(shell uname)

export DEVSTACK_WORKSPACE

include *.mk

# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

requirements: ## Install requirements
	pip install -r requirements.txt

dev.clone: ## Clone service repos to the parent directory
	./repo.sh clone

dev.provision.run: ## Provision all services with local mounted directories
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" ./provision.sh

dev.provision: | check-memory dev.provision.run stop ## Provision dev environment with all services stopped

dev.reset: | down dev.repo.reset pull dev.up static update-db ## Attempts to reset the local devstack to a the master working state

dev.status: ## Prints the status of all git repositories
	./repo.sh status

dev.repo.reset: ## Attempts to reset the local repo checkouts to the master working state
	./repo.sh reset

dev.up: | check-memory ## Bring up all services with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml up -d

dev.up.watchers: | check-memory ## Bring up asset watcher containers
	docker-compose -f docker-compose-watchers.yml up -d

dev.up.all: | dev.up dev.up.watchers ## Bring up all services with host volumes, including watchers

dev.sync.daemon.start: ## Start the docker-sycn daemon
	docker-sync start

dev.sync.provision: | dev.sync.daemon.start dev.provision ## Provision with docker-sync enabled

dev.sync.requirements: ## Install requirements
	gem install docker-sync

dev.sync.up: dev.sync.daemon.start ## Bring up all services with docker-sync enabled
	docker-compose -f docker-compose.yml -f docker-compose-sync.yml up -d

provision: | dev.provision ## This command will be deprecated in a future release, use dev.provision
	echo "\033[0;31mThis command will be deprecated in a future release, use dev.provision\033[0m"

stop: ## Stop all services
	(test -d .docker-sync && docker-sync stop) || true ## Ignore failure here
	docker-compose stop

stop.watchers: ## Stop asset watchers
	docker-compose -f docker-compose-watchers.yml stop

stop.all: | stop stop.watchers ## Stop all containers, including asset watchers

down: ## Remove all service containers and networks
	(test -d .docker-sync && docker-sync clean) || true ## Ignore failure here
	docker-compose -f docker-compose.yml -f docker-compose-watchers.yml down

destroy: ## Remove all devstack-related containers, networks, and volumes
	./destroy.sh

logs: ## View logs from containers running in detached mode
	docker-compose logs -f

%-logs: ## View the logs of the specified service container
	docker-compose logs -f --tail=500 $*

pull: ## Update Docker images
	docker-compose pull --parallel

validate: ## Validate the devstack configuration
	docker-compose config

backup: ## Write all data volumes to the host.
	docker run --rm --volumes-from edx.devstack.mysql -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mysql.tar.gz /var/lib/mysql
	docker run --rm --volumes-from edx.devstack.mongo -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mongo.tar.gz /data/db
	docker run --rm --volumes-from edx.devstack.elasticsearch -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/elasticsearch.tar.gz /usr/share/elasticsearch/data

restore:  ## Restore all data volumes from the host. WARNING: THIS WILL OVERWRITE ALL EXISTING DATA!
	docker run --rm --volumes-from edx.devstack.mysql -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/mysql.tar.gz
	docker run --rm --volumes-from edx.devstack.mongo -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/mongo.tar.gz
	docker run --rm --volumes-from edx.devstack.elasticsearch -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/elasticsearch.tar.gz

# TODO: Print out help for this target. Even better if we can iterate over the
# services in docker-compose.yml, and print the actual service names.
%-shell: ## Run a shell on the specified service container
	docker exec -it edx.devstack.$* env TERM=$(TERM) /edx/app/$*/devstack.sh open

credentials-shell: ## Run a shell on the credentials container
	docker exec -it edx.devstack.credentials env TERM=$(TERM) bash

e2e-shell: ## Start the end-to-end tests container with a shell
	docker run -it --network=devstack_default -v ${DEVSTACK_WORKSPACE}/edx-e2e-tests:/edx-e2e-tests -v ${DEVSTACK_WORKSPACE}/edx-platform:/edx-e2e-tests/lib/edx-platform --env-file ${DEVSTACK_WORKSPACE}/edx-e2e-tests/devstack_env edxops/e2e env TERM=$(TERM) bash

forum-shell:  ## Run a shell on the forum container
	docker exec -it edx.devstack.forum env TERM=$(TERM) bash

%-update-db: ## Run migrations for the specified service container
	docker exec -t edx.devstack.$* bash -c 'source /edx/app/$*/$*_env && cd /edx/app/$*/$*/ && make migrate'

studio-update-db: ## Run migrations for the Studio container
	docker exec -t edx.devstack.studio bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_db'

lms-update-db: ## Run migrations LMS container
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_db'

credentials-update-db: ## Run migrations for the credentials container
	docker exec -t edx.devstack.credentials bash -c 'make migrate'

update-db: | studio-update-db lms-update-db discovery-update-db ecommerce-update-db credentials-update-db ## Run the migrations for all services

lms-shell: ## Run a shell on the LMS container
	docker exec -it edx.devstack.lms env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

lms-watcher-shell: ## Run a shell on the LMS watcher container
	docker exec -it edx.devstack.lms_watcher env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

%-attach: ## Attach to the specified service container process to use the debugger & see logs.
	docker attach edx.devstack.$*

lms-restart: ## Kill the LMS Django development server. The watcher process will restart it.
	docker exec -t edx.devstack.lms bash -c 'kill $$(ps aux | grep "manage.py lms" | egrep -v "while|grep" | awk "{print \$$2}")'

studio-shell: ## Run a shell on the Studio container
	docker exec -it edx.devstack.studio env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

studio-watcher-shell: ## Run a shell on the studio watcher container
	docker exec -it edx.devstack.studio_watcher env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

studio-restart: ## Kill the LMS Django development server. The watcher process will restart it.
	docker exec -t edx.devstack.studio bash -c 'kill $$(ps aux | grep "manage.py cms" | egrep -v "while|grep" | awk "{print \$$2}")'

%-static: ## Rebuild static assets for the specified service container
	docker exec -t edx.devstack.$* bash -c 'source /edx/app/$*/$*_env && cd /edx/app/$*/$*/ && make static'

credentials-static: ## Rebuild static assets for the credentials container
	docker exec -t edx.devstack.credentials bash -c 'make static'

lms-static: ## Rebuild static assets for the LMS container
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_assets'

studio-static: ## Rebuild static assets for the Studio container
	docker exec -t edx.devstack.studio bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_assets'

static: | credentials-static discovery-static ecommerce-static lms-static studio-static ## Rebuild static assets for all service containers

healthchecks: ## Run a curl against all services' healthcheck endpoints to make sure they are up. This will eventually be parameterized
	./healthchecks.sh

e2e-tests: ## Run the end-to-end tests against the service containers
	docker run -t --network=devstack_default -v ${DEVSTACK_WORKSPACE}/edx-e2e-tests:/edx-e2e-tests -v ${DEVSTACK_WORKSPACE}/edx-platform:/edx-e2e-tests/lib/edx-platform --env-file ${DEVSTACK_WORKSPACE}/edx-e2e-tests/devstack_env edxops/e2e env TERM=$(TERM)  bash -c 'paver e2e_test --exclude="whitelabel\|enterprise"'

validate-lms-volume: ## Validate that changes to the local workspace are reflected in the LMS container
	touch $(DEVSTACK_WORKSPACE)/edx-platform/testfile
	docker exec edx.devstack.lms ls /edx/app/edxapp/edx-platform/testfile
	rm $(DEVSTACK_WORKSPACE)/edx-platform/testfile

vnc-passwords: ## Get the VNC passwords for the Chrome and Firefox Selenium containers
	@docker logs edx.devstack.chrome 2>&1 | grep "VNC password" | tail -1
	@docker logs edx.devstack.firefox 2>&1 | grep "VNC password" | tail -1

mysql-shell: ## Run a shell on the mysql container
	docker-compose exec mysql bash

mysql-shell-edxapp: ## Run a mysql shell on the edxapp database
	docker-compose exec mysql bash -c "mysql edxapp"

mongo-shell: ## Run a shell on the mongo container
	docker-compose exec mongo bash

# Provisions studio, ecommerce, and marketing with course(s) in test-course.json
# Modify test-course.json before running this make target to generate a custom course
create-test-course: ## NOTE: marketing course creation is not available for those outside edX
	./course-generator/create-courses.sh --studio --ecommerce --marketing course-generator/test-course.json

# Run the course json builder script and use the outputted course json to provision studio, ecommerce, and marketing
# Modify the list of courses in build-course-json.sh beforehand to generate custom courses
build-courses: ## NOTE: marketing course creation is not available for those outside edX
	./course-generator/build-course-json.sh course-generator/tmp-config.json
	./course-generator/create-courses.sh --studio --ecommerce --marketing course-generator/tmp-config.json
	rm course-generator/tmp-config.json

check-memory:
	@if [ `docker info --format '{{json .}}' | python -c "from __future__ import print_function; import sys, json; print(json.load(sys.stdin)['MemTotal'])"` -lt 2147483648 ]; then echo "\033[0;31mWarning, System Memory is set too low!!! Increase Docker memory to be at least 2 Gigs\033[0m"; fi || exit 0

