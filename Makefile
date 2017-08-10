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
	./clone.sh

dev.provision.run: ## Provision all services with local mounted directories
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" ./provision.sh

dev.provision: | check-memory dev.provision.run stop ## Provision dev environment with all services stopped

dev.up: | check-memory ## Bring up all services with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml up -d

dev.sync.daemon.start: ## Start the docker-sycn daemon
	docker-sync start

dev.sync.provision: | dev.sync.daemon.start dev.provision ## Provision with docker-sync enabled

dev.sync.requirements: ## Install requirements
	gem install docker-sync

dev.sync.up: dev.sync.daemon.start ## Bring up all services with docker-sync enabled
	docker-compose -f docker-compose.yml -f docker-compose-sync.yml up -d

provision: | check-memory ## Provision all services using the Docker volume
	./provision.sh

stop: ## Stop all services
	(test -d .docker-sync && docker-sync stop) || true ## Ignore failure here
	docker-compose stop

down: ## Remove all service containers and networks
	(test -d .docker-sync && docker-sync clean) || true ## Ignore failure here
	docker-compose down

destroy: ## Remove all devstack-related containers, networks, and volumes
	./destroy.sh

logs: ## View logs from containers running in detached mode
	docker-compose logs -f

%-logs: ## View the logs of the specified service container
	docker-compose logs -f --tail=500 | grep edx.devstack.$*

pull: ## Update Docker images
	docker-compose pull

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

lms-shell: ## Run a shell on the LMS container
	docker exec -it edx.devstack.lms env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

studio-shell: ## Run a shell on the Studio container
	docker exec -it edx.devstack.studio env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

healthchecks: ## Run a curl against all services' healthcheck endpoints to make sure they are up. This will eventually be parameterized
	./healthchecks.sh

validate-lms-volume: ## Validate that changes to the local workspace are reflected in the LMS container
	touch $(DEVSTACK_WORKSPACE)/edx-platform/testfile
	docker exec edx.devstack.lms ls /edx/app/edxapp/edx-platform/testfile
	rm $(DEVSTACK_WORKSPACE)/edx-platform/testfile

vnc-passwords: ## Get the VNC passwords for the Chrome and Firefox Selenium containers
	@docker logs edx.devstack.chrome 2>&1 | grep "VNC password" | tail -1
	@docker logs edx.devstack.firefox 2>&1 | grep "VNC password" | tail -1

mysql-shell: ## Run a shell on the mysql container
	docker-compose exec mysql bash

create-course-studio: ## Generates a course on studio using the configurations in test-course.json
	./course-generator/create-course-studio.sh ./course-generator/test-course.json

create-course-ecommerce: ## Generates a course on ecommerce using the configurations in test-course.json
	./course-generator/create-course-ecommerce.sh ./course-generator/test-course.json

check-memory:
	@if [ `docker info --format '{{json .}}' | python -c "from __future__ import print_function; import sys, json; print(json.load(sys.stdin)['MemTotal'])"` -lt 2147483648 ]; then echo "\033[0;31mWarning, System Memory is set too low!!! Increase Docker memory to be at least 2 Gigs\033[0m"; fi || exit 0
	