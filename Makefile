########################################################################################################################
#
# When adding a new target:
#   - If you are adding a new service make sure the dev.reset target will fully reset said service.
#
########################################################################################################################
.DEFAULT_GOAL := help
.PHONY: requirements

DEVSTACK_WORKSPACE ?= $(shell pwd)/..

OS := $(shell uname)

# Need to run some things under winpty in a Windows git-bash shell
# (but not when calling bash from a command shell or PowerShell)
ifneq (,$(MINGW_PREFIX))
    WINPTY := winpty
else
    WINPTY :=
endif

# Don't try redirecting to /dev/null in any Windows shell
ifneq (,$(findstring MINGW,$(OS)))
    DEVNULL :=
else
    DEVNULL := >/dev/null
endif

COMPOSE_PROJECT_NAME=devstack

export DEVSTACK_WORKSPACE
export COMPOSE_PROJECT_NAME

include *.mk

# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

requirements: ## Install requirements
	pip install -r requirements/base.txt

upgrade: export CUSTOM_COMPILE_COMMAND=make upgrade
upgrade: ## Upgrade requirements with pip-tools
	pip install -qr requirements/pip-tools.txt
	pip-compile --upgrade -o requirements/pip-tools.txt requirements/pip-tools.in
	pip-compile --upgrade -o requirements/base.txt requirements/base.in

dev.checkout: ## Check out "openedx-release/$OPENEDX_RELEASE" in each repo if set, "master" otherwise
	./repo.sh checkout

dev.clone: ## Clone service repos to the parent directory
	./repo.sh clone

dev.provision.run: ## Provision all services with local mounted directories
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" $(WINPTY) bash ./provision.sh

dev.provision: | check-memory dev.clone dev.provision.run stop ## Provision dev environment with all services stopped

dev.provision.xqueue: | check-memory dev.provision.xqueue.run stop stop.xqueue  # Provision XQueue; run after other services are provisioned

dev.provision.xqueue.run:
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-xqueue.yml" $(WINPTY) bash ./provision-xqueue.sh

dev.reset: | down dev.repo.reset pull dev.up static update-db ## Attempts to reset the local devstack to the master working state

dev.status: ## Prints the status of all git repositories
	$(WINPTY) bash ./repo.sh status

dev.repo.reset: ## Attempts to reset the local repo checkouts to the master working state
	$(WINPTY) bash ./repo.sh reset

dev.up: | check-memory ## Bring up all services with host volumes
	bash -c 'docker-compose -f docker-compose.yml -f docker-compose-host.yml up -d'
	@# Comment out this next line if you want to save some time and don't care about catalog programs
	$(WINPTY) bash ./programs/provision.sh cache $(DEVNULL)

dev.up.watchers: | check-memory ## Bring up asset watcher containers
	bash -c 'docker-compose -f docker-compose-watchers.yml up -d'

dev.up.xqueue: | check-memory ## Bring up xqueue, assumes you already have lms running
	bash -c 'docker-compose -f docker-compose.yml -f docker-compose-xqueue.yml -f docker-compose-host.yml up -d'

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

stop.all: | stop.analytics_pipeline stop stop.watchers ## Stop all containers, including asset watchers

stop.xqueue: ## Stop the XQueue service container
	docker-compose -f docker-compose-xqueue.yml stop

down: ## Remove all service containers and networks
	(test -d .docker-sync && docker-sync clean) || true ## Ignore failure here
	docker-compose -f docker-compose.yml -f docker-compose-watchers.yml -f docker-compose-xqueue.yml -f docker-compose-analytics-pipeline.yml down

destroy: ## Remove all devstack-related containers, networks, and volumes
	$(WINPTY) bash ./destroy.sh

logs: ## View logs from containers running in detached mode
	docker-compose -f docker-compose.yml -f docker-compose-analytics-pipeline.yml logs -f

%-logs: ## View the logs of the specified service container
	docker-compose -f docker-compose.yml -f docker-compose-analytics-pipeline.yml logs -f --tail=500 $*

xqueue-logs: ## View logs from containers running in detached mode
	docker-compose -f docker-compose-xqueue.yml logs -f xqueue

xqueue_consumer-logs: ## View logs from containers running in detached mode
	docker-compose -f docker-compose-xqueue.yml logs -f xqueue_consumer

pull: ## Update Docker images
	docker-compose pull

pull.xqueue: ## Update XQueue Docker images
	docker-compose -f docker-compose-xqueue.yml pull

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
	docker exec -it edx.devstack.$* /bin/bash

credentials-shell: ## Run a shell on the credentials container
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

static: | credentials-static discovery-static ecommerce-static lms-static studio-static ## Rebuild static assets for all service containers

healthchecks: ## Run a curl against all services' healthcheck endpoints to make sure they are up. This will eventually be parameterized
	$(WINPTY) bash ./healthchecks.sh

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
	bash -c 'docker-compose -f docker-compose.yml -f docker-compose-analytics-pipeline.yml -f docker-compose-host.yml up -d analyticspipeline'

pull.analytics_pipeline: ## Update analytics pipeline docker images
	docker-compose -f docker-compose.yml -f docker-compose-analytics-pipeline.yml pull

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
	$(WINPTY) bash ./course-generator/create-courses.sh --studio --ecommerce --marketing course-generator/test-course.json

# Run the course json builder script and use the outputted course json to provision studio, ecommerce, and marketing
# Modify the list of courses in build-course-json.sh beforehand to generate custom courses
build-courses: ## NOTE: marketing course creation is not available for those outside edX
	$(WINPTY) bash ./course-generator/build-course-json.sh course-generator/tmp-config.json
	$(WINPTY) bash ./course-generator/create-courses.sh --studio --ecommerce --marketing course-generator/tmp-config.json
	rm course-generator/tmp-config.json

check-memory: ## Check if enough memory has been allocated to Docker
	@if [ `docker info --format '{{.MemTotal}}'` -lt 2095771648 ]; then echo "\033[0;31mWarning, System Memory is set too low!!! Increase Docker memory to be at least 2 Gigs\033[0m"; fi || exit 0

stats: ## Get per-container CPU and memory utilization data
	docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
