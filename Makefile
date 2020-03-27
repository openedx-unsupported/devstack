########################################################################################################################
#
# When adding a new target:
#   - If you are adding a new service make sure the dev.reset target will fully reset said service.
#
########################################################################################################################
.DEFAULT_GOAL := help

.PHONY: analytics-pipeline-devstack-test analytics-pipeline-shell backup \
        build-courses check-memory create-test-course credentials-shell \
        destroy dev.cache-programs dev.checkout dev.clone dev.clone.ssh \
        dev.nfs.provision dev.nfs.provision.services dev.nfs.setup dev.nfs.up \
        dev.nfs.up.all dev.nfs.up.watchers devpi-password dev.provision \
        dev.provision.analytics_pipeline dev.provision.analytics_pipeline.run \
        dev.provision.services dev.provision.xqueue dev.provision.xqueue.run \
        dev.pull dev.repo.reset dev.reset dev.status dev.sync.daemon.start \
        dev.sync.provision dev.sync.requirements dev.sync.up dev.up dev.up.all \
        dev.up.analytics_pipeline dev.up.watchers dev.up.with-programs \
        dev.up.xqueue discovery-shell down e2e-shell e2e-tests ecommerce-shell \
        feature-toggle-state forum-restart-devserver healthchecks help lms-restart \
        lms-shell lms-static lms-update-db lms-watcher-shell logs mongo-shell \
        mysql-shell mysql-shell-edxapp provision pull pull.analytics_pipeline \
        pull.xqueue registrar-shell requirements restore static stats stop \
        stop.all stop.analytics_pipeline stop.watchers stop.xqueue \
        studio-restart studio-shell studio-static studio-update-db \
        studio-watcher-shell update-db upgrade upgrade validate \
        validate-lms-volume vnc-passwords xqueue_consumer-logs \
        xqueue_consumer-restart xqueue_consumer-shell xqueue-logs \
        xqueue-restart xqueue-shell

# Docker Compose files that define services.
MAIN_COMPOSE_FILE=-f docker-compose.yml
XQUEUE_COMPOSE_FILE=-f docker-compose-xqueue.yml
WATCHERS_COMPOSE_FILE=-f docker-compose-watchers.yml
WATCHERS_COMPOSE_FILE_FOR_NFS=-f docker-compose-watchers-nfs.yml
ANALYTICS_COMPOSE_FILE=-f docker-compose-analytics-pipeline.yml
MARKETING_COMPOSE_FILE=-f docker-compose-marketing-site.yml

# Supporting Docker Compose files to enable volume mounting (which allows us to use
# source code from our host machine) as well as theming.
SUPPORTING_COMPOSE_FILES=-f docker-compose-host.yml -f docker-compose-themes.yml
SUPPORTING_COMPOSE_FILES_FOR_NFS=-f docker-compose-host-nfs.yml -f docker-compose-themes-nfs.yml
SUPPORTING_COMPOSE_FILES_FOR_SYNC=-f docker-compose-sync.yml

# "Suites" of Docker Compose files that can be used together to run different
# sets of services.
STANDARD_COMPOSE_SUITE=$(MAIN_COMPOSE_FILE) $(SUPPORTING_COMPOSE_FILES)
STANDARD_COMPOSE_SUITE_FOR_NFS=$(MAIN_COMPOSE_FILE) $(SUPPORTING_COMPOSE_FILES_FOR_NFS)
STANDARD_COMPOSE_SUITE_FOR_SYNC=$(MAIN_COMPOSE_FILE)  $(SUPPORTING_COMPOSE_FILES_FOR_SYNC)
XQUEUE_COMPOSE_SUITE=$(MAIN_COMPOSE_FILE) $(XQUEUE_COMPOSE_FILE) $(SUPPORTING_COMPOSE_FILES)
ANALYTICS_COMPOSE_SUITE=$(STANDARD_COMPOSE_SUITE) $(ANALYTICS_COMPOSE_FILE)

# All Docker Compose YAML files that contain service definitions.
# Useful for Makefile targets like `dev.pull` and `down`
ALL_SERVICE_COMPOSE_FILES=\
$(MAIN_COMPOSE_FILE) \
$(XQUEUE_COMPOSE_FILE) \
$(WATCHERS_COMPOSE_FILE) \
$(ANALYTICS_COMPOSE_FILE) \
$(MARKETING_COMPOSE_FILE)

# All Docker Compose files (except those for NFS and Docker Sync).
FULL_COMPOSE_SUITE=$(ALL_SERVICE_COMPOSE_FILES) $(SUPPORTING_COMPOSE_FILES)

# Include options (configurable through options.local.mk)
include options.mk
export

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

# Include specialized Make commands.
include marketing.mk

# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@awk -F ':.*?## ' '/^[a-zA-Z]/ && NF==2 {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

requirements: ## Install requirements
	pip install -r requirements/base.txt

upgrade: export CUSTOM_COMPILE_COMMAND=make upgrade
upgrade: ## Upgrade requirements with pip-tools
	pip install -qr requirements/pip-tools.txt
	pip-compile --upgrade -o requirements/pip-tools.txt requirements/pip-tools.in
	pip-compile --upgrade -o requirements/base.txt requirements/base.in

dev.checkout: ## Check out "openedx-release/$OPENEDX_RELEASE" in each repo if set, "master" otherwise
	./repo.sh checkout

dev.clone: ## Clone service repos using HTTPS method to the parent directory
	./repo.sh clone

dev.clone.ssh: ## Clone service repos using SSH method to the parent directory
	./repo.sh clone_ssh

dev.provision.services: ## Provision all services with local mounted directories
	DOCKER_COMPOSE_FILES="$(STANDARD_COMPOSE_SUITE)" $(WINPTY) bash ./provision.sh

dev.provision.services.%: ## Provision specified services with local mounted directories, separated by plus signs
	DOCKER_COMPOSE_FILES="$(STANDARD_COMPOSE_SUITE)" $(WINPTY) bash ./provision.sh $*

dev.provision: | check-memory dev.clone.ssh dev.provision.services stop ## Provision dev environment with all services stopped

dev.cache-programs: ## Copy programs from Discovery to Memcached for use in LMS.
	$(WINPTY) bash ./programs/provision.sh cache

dev.provision.xqueue: | check-memory dev.provision.xqueue.run stop stop.xqueue  # Provision XQueue; run after other services are provisioned

dev.provision.xqueue.run:
	DOCKER_COMPOSE_FILES="$(MAIN_COMPOSE_FILE) $(XQUEUE_COMPOSE_FILE)" $(WINPTY) bash ./provision-xqueue.sh

dev.reset: | down dev.repo.reset pull dev.up static update-db ## Attempts to reset the local devstack to the master working state

dev.status: ## Prints the status of all git repositories
	$(WINPTY) bash ./repo.sh status

dev.repo.reset: ## Attempts to reset the local repo checkouts to the master working state
	$(WINPTY) bash ./repo.sh reset

dev.pull: ## Pull *all* required Docker images. Consider `make dev.pull.<service>` instead.
	docker-compose pull

dev.pull-without-deps.%: ## Pull latest Docker images for services (separated by plus-signs).
	ARG=$* docker-compose $(ALL_SERVICE_COMPOSE_FILES) pull $$(echo $* | tr + " ")

dev.pull.%: ## Pull latest Docker images for services (separated by plus-signs) and all their dependencies.
	docker-compose $(ALL_SERVICE_COMPOSE_FILES) pull --include-deps $$(echo $* | tr + " ")

dev.up: | check-memory ## Bring up all services with host volumes
	bash -c 'docker-compose $(STANDARD_COMPOSE_SUITE) up -d'
ifeq ($(ALWAYS_CACHE_PROGRAMS),true)
	make dev.cache-programs
endif

dev.up.%: | check-memory ## Bring up specific services (separated by plus-signs) and their dependencies with host volumes.
	bash -c 'docker-compose $(STANDARD_COMPOSE_SUITE) up -d $$(echo $* | tr + " ")'
ifeq ($(ALWAYS_CACHE_PROGRAMS),true)
	make dev.cache-programs
endif

dev.up.with-programs: dev.up dev.cache-programs  ## Bring up a all services and cache programs in LMS.

dev.up.with-programs.%: ## Bring up a service and its dependencies and cache programs in LMS.
	make dev.up.$*
	make dev.cache-programs

dev.up.watchers: | check-memory ## Bring up asset watcher containers
	bash -c 'docker-compose $(WATCHERS_COMPOSE_FILE) up -d'

dev.nfs.setup:  ## set's up an nfs server on the /Users folder, allowing nfs mounting on docker
	./setup_native_nfs_docker_osx.sh

dev.nfs.up.watchers: | check-memory ## Bring up asset watcher containers
	docker-compose $(WATCHERS_COMPOSE_FILE_FOR_NFS) up -d

dev.nfs.up: | check-memory ## Bring up all services with host volumes
	docker-compose $(STANDARD_COMPOSE_SUITE_FOR_NFS) up -d

dev.nfs.up.all: | dev.nfs.up dev.nfs.up.watchers ## Bring up all services with host volumes, including watchers

dev.nfs.provision: | check-memory dev.clone dev.nfs.provision.services stop ## Provision dev environment with all services stopped

dev.nfs.provision.services: ## Provision all services with local mounted directories
	DOCKER_COMPOSE_FILES="$(STANDARD_COMPOSE_SUITE_FOR_NFS)" ./provision.sh

dev.nfs.provision.services.%: ## Provision specified services with local mounted directories, separated by plus signs
	DOCKER_COMPOSE_FILES="$(STANDARD_COMPOSE_SUITE_FOR_NFS)" ./provision.sh $*

dev.up.xqueue: | check-memory ## Bring up xqueue, assumes you already have lms running
	bash -c 'docker-compose $(XQUEUE_COMPOSE_SUITE) up -d'

dev.up.all: | dev.up dev.up.watchers ## Bring up all services with host volumes, including watchers

dev.sync.daemon.start: ## Start the docker-sycn daemon
	docker-sync start

dev.sync.provision: | dev.sync.daemon.start dev.provision ## Provision with docker-sync enabled

dev.sync.requirements: ## Install requirements
	gem install docker-sync

dev.sync.up: dev.sync.daemon.start ## Bring up all services with docker-sync enabled
	docker-compose $(STANDARD_COMPOSE_SUITE_FOR_SYNC) up -d

provision: | dev.provision ## This command will be deprecated in a future release, use dev.provision
	echo "\033[0;31mThis command will be deprecated in a future release, use dev.provision\033[0m"

stop: ## Stop all services
	(test -d .docker-sync && docker-sync stop) || true ## Ignore failure here
	docker-compose stop

stop.watchers: ## Stop asset watchers
	docker-compose $(WATCHERS_COMPOSE_FILE) stop

stop.all: | stop.analytics_pipeline stop stop.watchers ## Stop all containers, including asset watchers

stop.xqueue: ## Stop the XQueue service container
	docker-compose $(XQUEUE_COMPOSE_FILE) stop

down: ## Remove all service containers and networks
	(test -d .docker-sync && docker-sync clean) || true ## Ignore failure here
	docker-compose $(ALL_SERVICE_COMPOSE_FILES) down

destroy: ## Remove all devstack-related containers, networks, and volumes
	$(WINPTY) bash ./destroy.sh

logs: ## View logs from containers running in detached mode
	docker-compose $(ALL_SERVICE_COMPOSE_FILES) logs -f

%-logs: ## View the logs of the specified service container
	docker-compose $(ALL_SERVICE_COMPOSE_FILES) logs -f --tail=500 $*

xqueue-logs: ## View logs from containers running in detached mode
	docker-compose $(XQUEUE_COMPOSE_FILE) logs -f xqueue

xqueue_consumer-logs: ## View logs from containers running in detached mode
	docker-compose $(XQUEUE_COMPOSE_FILE) logs -f xqueue_consumer

RED="\033[0;31m"
YELLOW="\033[0;33m"
GREY="\033[1;90m"
NO_COLOR="\033[0m"

pull: dev.pull
	@echo -n $(RED)
	@echo "******************* PLEASE NOTE ********************************"
	@echo -n $(YELLOW)
	@echo "The 'make pull' command is deprecated."
	@echo "Please use 'make dev.pull.<service>'."
	@echo "It will pull all the images that the given serivce depends upon."
	@echo "Example: "
	@echo "----------------------------------"
	@echo -n $(GREY)
	@echo "~/devstack$$ make dev.pull.lms"
	@echo "   Pulling chrome        ... done"
	@echo "   Pulling firefox       ... done"
	@echo "   Pulling memcached     ... done"
	@echo "   Pulling mongo         ... done"
	@echo "   Pulling mysql         ... done"
	@echo "   Pulling elasticsearch ... done"
	@echo "   Pulling discovery     ... done"
	@echo "   Pulling forum         ... done"
	@echo "   Pulling devpi         ... done"
	@echo "   Pulling lms           ... done"
	@echo "~/devstack$$"
	@echo -n $(YELLOW)
	@echo "----------------------------------"
	@echo "If you must pull all images, such as for initial"
	@echo "provisioning, run 'make dev.pull'."
	@echo -n $(RED)
	@echo "****************************************************************"
	@echo -n $(NO_COLOR)

pull.xqueue: ## Update XQueue Docker images
	docker-compose $(XQUEUE_COMPOSE_FILE) pull

validate: ## Validate the devstack configuration
	docker-compose config

backup: dev.up.mysql+mongo+elasticsearch ## Write all data volumes to the host.
	docker run --rm --volumes-from edx.devstack.mysql -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mysql.tar.gz /var/lib/mysql
	docker run --rm --volumes-from edx.devstack.mongo -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mongo.tar.gz /data/db
	docker run --rm --volumes-from edx.devstack.elasticsearch -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/elasticsearch.tar.gz /usr/share/elasticsearch/data

restore: dev.up.mysql+mongo+elasticsearch ## Restore all data volumes from the host. WARNING: THIS WILL OVERWRITE ALL EXISTING DATA!
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

registrar-shell: ## Run a shell on the registrar site container
	docker exec -it edx.devstack.registrar env TERM=$(TERM) /edx/app/registrar/devstack.sh open

%-update-db: ## Run migrations for the specified service container
	docker exec -t edx.devstack.$* bash -c 'source /edx/app/$*/$*_env && cd /edx/app/$*/$*/ && make migrate'

studio-update-db: ## Run migrations for the Studio container
	docker exec -t edx.devstack.studio bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_db'

lms-update-db: ## Run migrations LMS container
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_db'

update-db: | studio-update-db lms-update-db discovery-update-db ecommerce-update-db credentials-update-db ## Run the migrations for all services

forum-restart-devserver: ## Kill the forum's Sinatra development server. The watcher process will restart it.
	docker exec -t edx.devstack.forum bash -c 'kill $$(ps aux | grep "ruby app.rb" | egrep -v "while|grep" | awk "{print \$$2}")'

lms-shell: ## Run a shell on the LMS container
	docker exec -it edx.devstack.lms env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

lms-watcher-shell: ## Run a shell on the LMS watcher container
	docker exec -it edx.devstack.lms_watcher env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

%-attach: ## Attach to the specified service container process to use the debugger & see logs.
	docker attach edx.devstack.$*

lms-restart: lms-restart-devserver

studio-shell: ## Run a shell on the Studio container
	docker exec -it edx.devstack.studio env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

studio-watcher-shell: ## Run a shell on the studio watcher container
	docker exec -it edx.devstack.studio_watcher env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

studio-restart: studio-restart-devserver

xqueue-shell: ## Run a shell on the XQueue container
	docker exec -it edx.devstack.xqueue env TERM=$(TERM) /edx/app/xqueue/devstack.sh open

xqueue-restart: xqueue-restart-devserver

%-restart-devserver: ## Kill a service's Django development server. The watcher process should restart it.
	docker exec -t edx.devstack.$* bash -c 'kill $$(ps aux | egrep "manage.py ?\w* runserver" | egrep -v "while|grep" | awk "{print \$$2}")'

xqueue_consumer-shell: ## Run a shell on the XQueue consumer container
	docker exec -it edx.devstack.xqueue_consumer env TERM=$(TERM) /edx/app/xqueue/devstack.sh open

xqueue_consumer-restart: ## Kill the XQueue development server. The watcher process will restart it.
	docker exec -t edx.devstack.xqueue_consumer bash -c 'kill $$(ps aux | grep "manage.py run_consumer" | egrep -v "while|grep" | awk "{print \$$2}")'

%-static: ## Rebuild static assets for the specified service container
	docker exec -t edx.devstack.$* bash -c 'source /edx/app/$*/$*_env && cd /edx/app/$*/$*/ && make static'

lms-static: ## Rebuild static assets for the LMS container
	docker exec -t edx.devstack.lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_assets lms'

studio-static: ## Rebuild static assets for the Studio container
	docker exec -t edx.devstack.studio bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && paver update_assets studio'

static: | credentials-static discovery-static ecommerce-static lms-static studio-static ## Rebuild static assets for all service containers

healthchecks: ## Run a curl against all services' healthcheck endpoints to make sure they are up. This will eventually be parameterized
	$(WINPTY) bash ./healthchecks.sh all

healthchecks.%:
	$(WINPTY) bash ./healthchecks.sh $*

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
	echo "Ran dev.provision.analytics_pipeline"

dev.provision.analytics_pipeline.run:
	DOCKER_COMPOSE_FILES="$(ANALYTICS_COMPOSE_SUITE)" ./provision-analytics-pipeline.sh

analytics-pipeline-shell: ## Run a shell on the analytics pipeline container
	docker exec -it edx.devstack.analytics_pipeline env TERM=$(TERM) /edx/app/analytics_pipeline/devstack.sh open

dev.up.analytics_pipeline: | check-memory ## Bring up analytics pipeline services
	bash -c 'docker-compose $(ANALYTICS_COMPOSE_SUITE) up -d analyticspipeline'

pull.analytics_pipeline: ## Update analytics pipeline docker images
	docker-compose $(ANALYTICS_COMPOSE_SUITE) pull

analytics-pipeline-devstack-test: ## Run analytics pipeline tests in travis build
	docker exec -u hadoop -i edx.devstack.analytics_pipeline bash -c 'sudo chown -R hadoop:hadoop /edx/app/analytics_pipeline && source /edx/app/hadoop/.bashrc && make develop-local && make docker-test-acceptance-local ONLY_TESTS=edx.analytics.tasks.tests.acceptance.test_internal_reporting_database && make docker-test-acceptance-local ONLY_TESTS=edx.analytics.tasks.tests.acceptance.test_user_activity'

stop.analytics_pipeline: ## Stop analytics pipeline services
	docker-compose $(ANALYTICS_COMPOSE_SUITE) stop
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

feature-toggle-state: ## Gather the state of feature toggles configured for various IDAs
	$(WINPTY) bash ./gather-feature-toggle-state.sh

selfcheck: ## check that the Makefile is well-formed
	@echo "The Makefile is well-formed."
