.DEFAULT_GOAL := help

include *.mk

# Generates a help message. Borrowed from https://github.com/pydanny/cookiecutter-djangopackage.
help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

requirements: ## Install requirements
	pip install -r requirements.txt

devstack.clone: ## Clone service repos to the parent directory
	DEVSTACK_WORKSPACE=$(DEVSTACK_WORKSPACE) ./clone.sh

devstack.provision.run: ## Provision all services with local mounted directories
	DEVSTACK_WORKSPACE=$(DEVSTACK_WORKSPACE) DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" ./provision.sh

devstack.provision: | devstack.provision.run devstack.provision.stop

devstack.up: ## Bring up all services with host volumes
	DEVSTACK_WORKSPACE=$(DEVSTACK_WORKSPACE) docker-compose -f docker-compose.yml -f docker-compose-host.yml up

devstack.sync.daemon.start:
	docker-sync-daemon start

devstack.sync.provision: | devstack.sync.daemon.start devstack.provision

devstack.sync.requirements: ## Install requirements
	gem install docker-sync

devstack.sync.up: | devstack.sync.daemon.start devstack.up ## Bring up all services with host volumes

provision: ## Provision all services
	./provision.sh

stop: ## Stop all services
	test -d .docker-sync && docker-sync-daemon stop
	docker-compose stop

down: ## Remove all service containers and networks
	test -d .docker-sync && docker-sync-daemon clean
	docker-compose down

destroy: ## Remove all devstack-related containers, networks, and volumes
	./destroy.sh

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

lms-shell: ## Run a shell on the LMS container
	docker exec -it edx.devstack.lms env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

studio-shell: ## Run a shell on the Studio container
	docker exec -it edx.devstack.studio env TERM=$(TERM) /edx/app/edxapp/devstack.sh open

healthchecks: ## Run a curl against all services' healthcheck endpoints to make sure they are up. This will eventually be parameterized
	./healthchecks.sh

validate-lms-volume:
	touch $(DEVSTACK_WORKSPACE)/edx-platform/testfile
	docker exec edx.devstack.lms ls /edx/app/edxapp/edx-platform/testfile
	rm $(DEVSTACK_WORKSPACE)/edx-platform/testfile
