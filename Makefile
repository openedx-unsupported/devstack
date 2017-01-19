.PHONY: clone devstack.provision devstack.reset devstack.start devstack.stop help requirements validate

backup-volumes: ## Backup all data volumes to the local host
	docker run --rm --volumes-from edx.devstack.mysql -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mysql.tar.gz /var/lib/mysql
	docker run --rm --volumes-from edx.devstack.mongo -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/mongo.tar.gz /data/db
	docker run --rm --volumes-from edx.devstack.elasticsearch -v $$(pwd)/.dev/backups:/backup debian:jessie tar zcvf /backup/elasticsearch.tar.gz /usr/share/elasticsearch/data

restore-volumes:  ## WARNING: THIS WILL OVERWRITE ALL EXISTING DATA!!! Restore all data volumes from the local host.
	docker run --rm --volumes-from edx.devstack.mysql -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/mysql.tar.gz
	docker run --rm --volumes-from edx.devstack.mongo -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/mongo.tar.gz
	docker run --rm --volumes-from edx.devstack.elasticsearch -v $$(pwd)/.dev/backups:/backup debian:jessie tar zxvf /backup/elasticsearch.tar.gz


help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

clone: ## Clone service repos
	./clone.sh

# TODO Print out help for this target. Even better if we can iterate over the services in docker-compose.yml, and
# print the actual service names.
devstack.open.%: ## Open a shell into the specified service container
	docker exec -it edx.devstack.$* env TERM=$(TERM) /edx/app/$*/devstack.sh open

devstack.provision: ## Provision all services
	./provision.sh

devstack.reset: ## Remove all service containers
	docker-compose down

devstack.start: ## Start all services
	docker-compose up

devstack.stop: ## Stop all services
	docker-compose stop

requirements: ## Install requirements
	pip install -r requirements.txt

validate: ## Validate the devstack configuration
	docker-compose config
