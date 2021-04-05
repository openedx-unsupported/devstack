########################################################################################################################
#
# When adding a new target:
#   - If you are adding a new service make sure the dev.reset target will fully reset said service.
#
########################################################################################################################
.DEFAULT_GOAL := help
.PHONY: requirements

DEVSTACK_WORKSPACE ?= $(shell pwd)/..
include .env

OS := $(shell uname)

COMPOSE_PROJECT_NAME=${EDRAAK_COMPOSE_PROJECT_NAME:-devstack}
DOCKER_COMPOSE_FILES=-f docker-compose.yml

ifeq (${ENABLE_PROGS}, true)
	DOCKER_COMPOSE_FILES+=-f docker-compose-progs.yml
	DOCKER_COMPOSE_FILES+=-f docker-compose-progs${MOUNT_TYPE}.yml
endif

ifeq (${ENABLE_MKTG}, true)
	DOCKER_COMPOSE_FILES+=-f docker-compose-mktg.yml
	DOCKER_COMPOSE_FILES+=-f docker-compose-mktg${MOUNT_TYPE}.yml
endif

ifeq (${ENABLE_EDX}, true)
	DOCKER_COMPOSE_FILES+=-f docker-compose-edx.yml
	DOCKER_COMPOSE_FILES+=-f docker-compose-edx${MOUNT_TYPE}.yml
endif

ifeq (${ENABLE_STATE_MANAGER}, true)
	DOCKER_COMPOSE_FILES+=-f docker-compose-state-manager.yml
	DOCKER_COMPOSE_FILES+=-f docker-compose-state-manager${MOUNT_TYPE}.yml
endif

ifeq (${ENABLE_JUDGE}, true)
	DOCKER_COMPOSE_FILES+=-f docker-compose-judge.yml
	DOCKER_COMPOSE_FILES+=-f docker-compose-judge${MOUNT_TYPE}.yml
endif

export DOCKER_COMPOSE_FILES

export DEVSTACK_WORKSPACE
export COMPOSE_PROJECT_NAME

include *.mk

compose-files:
	echo ${DOCKER_COMPOSE_FILES};

# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

requirements: ## Install requirements
	pip install -r requirements/base.txt

upgrade: ## Upgrade requirements with pip-tools
	pip install -qr requirements/pip-tools.txt
	pip-compile --upgrade -o requirements/pip-tools.txt requirements/pip-tools.in
	pip-compile --upgrade -o requirements/base.txt requirements/base.in
	bash post-pip-compile.sh \
		requirements/pip-tools.txt \
		requirements/base.txt \

dev.checkout: ## Check out "masters" otherwise
	./repo.sh checkout

dev.clone: ## Clone service repos to the parent directory
	./repo.sh clone

dev.provision.run: ## Provision all services with local mounted directories
	./provision.sh

dev.provision: | check-memory dev.clone dev.provision.run stop ## Provision dev environment with all services stopped


dev.reset: | down dev.repo.reset pull dev.up static update-db ## Attempts to reset the local devstack to a the master working state

dev.status: ## Prints the status of all git repositories
	./repo.sh status

dev.repo.reset: ## Attempts to reset the local repo checkouts to the master working state
	./repo.sh reset

dev.editable-envs:  ## Copy env files outside the docker containers so it's editable by the developer
	mkdir -p $(DEVSTACK_WORKSPACE)/src/edxapp-envs/
	@docker exec -it edx.devstack.lms bash -c 'test -f /edx/src/edxapp-envs/lms.env.json || mv /edx/app/edxapp/lms.{env,auth}.json /edx/src/edxapp-envs/'
	@docker exec -it edx.devstack.lms bash -c 'ln -sf /edx/src/edxapp-envs/lms.{env,auth}.json /edx/app/edxapp/'
	@docker exec -it edx.devstack.studio bash -c 'test -f /edx/src/edxapp-envs/cms.env.json || mv /edx/app/edxapp/cms.{env,auth}.json /edx/src/edxapp-envs/'
	@docker exec -it edx.devstack.studio bash -c 'ln -sf /edx/src/edxapp-envs/cms.{env,auth}.json /edx/app/edxapp/'
	@sudo chown -R $(USER) $(DEVSTACK_WORKSPACE)/src
	@make lms-restart
	@make studio-restart

dev.up: | check-memory ## Bring up all services with host volumes
	docker-compose ${DOCKER_COMPOSE_FILES} up -d

edraak.dev.up.hacks:
	@# Start: Edraak hacks
	@# TODO: Add this to `base.in` (thus `development.txt`) and rebuild the docker image
	@make dev.editable-envs
	@for container in lms studio lms_watcher studio_watcher; do \
		 docker exec -it edx.devstack.$$container bash -c 'source /edx/app/edxapp/edxapp_env && pip install python-bidi==0.4.0'; \
		 docker exec -it edx.devstack.$$container bash -c 'source /edx/app/edxapp/edxapp_env && pip install wand==0.5.1'; \
		 docker exec -it edx.devstack.$$container bash -c 'source /edx/app/edxapp/edxapp_env && pip install -e /edx/app/edxapp/edx-platform'; \
    done;
	@make lms-restart
	@make studio-restart
	@# End: Edraak hacks

provision: | dev.provision

stop: ## Stop all services
	(test -d .docker-sync && docker-sync stop) || true ## Ignore failure here
	docker-compose ${DOCKER_COMPOSE_FILES} stop

down: ## Remove all service containers and networks
	docker-compose ${DOCKER_COMPOSE_FILES} down

destroy: ## Remove all devstack-related containers, networks, and volumes
	./destroy.sh

logs: ## View logs from containers running in detached mode
	docker-compose ${DOCKER_COMPOSE_FILES} logs -f --tail 10

%-logs: ## View the logs of the specified service container
	docker-compose ${DOCKER_COMPOSE_FILES} logs -f --tail=500 $*

pull:
	docker-compose pull --parallel

validate: ## Validate the devstack configuration
	docker-compose ${DOCKER_COMPOSE_FILES} config

backup: ## Write all data volumes to the host.
	docker run --rm --volumes-from edx.devstack.mysql -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mysql.tar.gz /var/lib/mysql
	docker run --rm --volumes-from edx.devstack.mongo -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mongo.tar.gz /data/db
	docker run --rm --volumes-from edx.devstack.elasticsearch -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/elasticsearch.tar.gz /usr/share/elasticsearch/data

restore:  ## Restore all data volumes from the host. WARNING: THIS WILL OVERWRITE ALL EXISTING DATA!
	docker run --rm --volumes-from edx.devstack.mysql -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/mysql.tar.gz
	docker run --rm --volumes-from edx.devstack.mongo -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/mongo.tar.gz
	docker run --rm --volumes-from edx.devstack.elasticsearch -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/elasticsearch.tar.gz

%-edbash: ## Run a shell on the specified service container
	docker exec -it edraak.devstack.$* /bin/bash


# TODO: Print out help for this target. Even better if we can iterate over the
# services in docker-compose.yml, and print the actual service names.
%-shell: ## Run a shell on the specified service container
	docker exec -it edx.devstack.$* /bin/bash


credentials-shell:
	docker exec -it edx.devstack.credentials env TERM=$(TERM) bash -c 'source /edx/app/credentials/credentials_env && cd /edx/app/credentials/credentials && /bin/bash'

discovery-shell: ## Run a shell on the discovery container
	docker exec -it edx.devstack.discovery env TERM=$(TERM) /edx/app/discovery/devstack.sh open

ecommerce-shell: ## Run a shell on the ecommerce container
	docker exec -it edx.devstack.ecommerce env TERM=$(TERM) /edx/app/ecommerce/devstack.sh open

e2e-shell: ## Start the end-to-end tests container with a shell
	docker run -it --network=devstack_default -v ${DEVSTACK_WORKSPACE}/edx-e2e-tests:/edx-e2e-tests -v ${DEVSTACK_WORKSPACE}/edx-platform:/edx-e2e-tests/lib/edx-platform --env-file ${DEVSTACK_WORKSPACE}/edx-e2e-tests/devstack_env edxops/e2e env TERM=$(TERM) bash

%-update-db: ## Run migrations for the specified service container
	docker exec -t edx.devstack.$* bash -c 'source /edx/app/$*/$*_env && cd /edx/app/$*/$*/ && make migrate'

studio-update-db: ## Run migrations for the Studio container
	docker exec -t edx.devstack.studio bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_db'

lms-update-db: ## Run migrations LMS container
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_db'

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

xqueue-shell: ## Run a shell on the XQueue container
	docker exec -it edx.devstack.xqueue env TERM=$(TERM) /edx/app/xqueue/devstack.sh open

xqueue-restart: ## Kill the XQueue development server. The watcher process will restart it.
	docker exec -t edx.devstack.xqueue bash -c 'kill $$(ps aux | grep "manage.py runserver" | egrep -v "while|grep" | awk "{print \$$2}")'

xqueue_consumer-shell: ## Run a shell on the XQueue consumer container
	docker exec -it edx.devstack.xqueue_consumer env TERM=$(TERM) /edx/app/xqueue/devstack.sh open

xqueue_consumer-restart: ## Kill the XQueue development server. The watcher process will restart it.
	docker exec -t edx.devstack.xqueue_consumer bash -c 'kill $$(ps aux | grep "manage.py run_consumer" | egrep -v "while|grep" | awk "{print \$$2}")'

%-static: ## Rebuild static assets for the specified service container
	docker exec -t edx.devstack.$* bash -c 'source /edx/app/$*/$*_env && cd /edx/app/$*/$*/ && make static'

lms-static: ## Rebuild static assets for the LMS container
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_assets'

studio-static: ## Rebuild static assets for the Studio container
	docker exec -t edx.devstack.studio bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_assets'

static: | lms-static studio-static ## Rebuild static assets for all service containers

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

devpi-password: ## Get the root devpi password for the devpi container
	docker-compose exec devpi bash -c "cat /data/server/.serverpassword"

mysql-shell: ## Run a shell on the mysql container
	docker-compose exec mysql bash

mysql-shell-edxapp: ## Run a mysql shell on the edxapp database
	docker-compose exec mysql bash -c "mysql edxapp"

mongo-shell: ## Run a shell on the mongo container
	docker-compose exec mongo bash

### analytics pipeline commands

dev.provision.analytics_pipeline: | check-memory dev.provision.analytics_pipeline.run stop.analytics_pipeline stop ## Provision analyticstack dev environment with all services stopped

dev.provision.analytics_pipeline.run:
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml -f docker-compose-analytics-pipeline.yml" ./provision-analytics-pipeline.sh

analytics-pipeline-shell: ## Run a shell on the analytics pipeline container
	docker exec -it edx.devstack.analytics_pipeline env TERM=$(TERM) /edx/app/analytics_pipeline/devstack.sh open

dev.up.analytics_pipeline: | check-memory ## Bring up analytics pipeline services
	docker-compose -f docker-compose.yml -f docker-compose-analytics-pipeline.yml -f docker-compose-host.yml up -d analyticspipeline

pull.analytics_pipeline: ## Update analytics pipeline docker images
	docker-compose -f docker-compose.yml -f docker-compose-analytics-pipeline.yml pull --parallel

analytics-pipeline-devstack-test: ## Run analytics pipeline tests in travis build
	docker exec -u hadoop -i edx.devstack.analytics_pipeline bash -c 'sudo chown -R hadoop:hadoop /edx/app/analytics_pipeline && source /edx/app/hadoop/.bashrc && make develop-local && make docker-test-acceptance-local ONLY_TESTS=edx.analytics.tasks.tests.acceptance.test_internal_reporting_database && make docker-test-acceptance-local ONLY_TESTS=edx.analytics.tasks.tests.acceptance.test_user_activity'

stop.analytics_pipeline: ## Stop analytics pipeline services
	docker-compose -f docker-compose.yml -f docker-compose-analytics-pipeline.yml stop
	docker-compose up -d mysql      ## restart mysql as other containers need it

hadoop-application-logs-%: ## View hadoop logs by application Id
	docker exec -it edx.devstack.analytics_pipeline.nodemanager yarn logs -applicationId $*

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

check-memory: ## Check if enough memory has been allocated to Docker
	@if [ `docker info --format '{{json .}}' | python -c "from __future__ import print_function; import sys, json; print(json.load(sys.stdin)['MemTotal'])"` -lt 2095771648 ]; then echo "\033[0;31mWarning, System Memory is set too low!!! Increase Docker memory to be at least 2 Gigs\033[0m"; fi || exit 0

stats: ## Get per-container CPU and memory utilization data
	docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
