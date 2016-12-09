.PHONY: clone devstack.provision devstack.reset devstack.start devstack.stop help requirements validate

help: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

clone: ## Clone service repos
	./clone.py

# TODO Print out help for this target. Even better if we can iterate over the services in docker-compose.yml, and
# print the actual service names.
devstack.open.%: ## Open a shell into the specified service container
	docker exec -it edx.devstack.$* env TERM=$(TERM) /edx/app/$*/devstack.sh open

devstack.provision: ## Provision all services
	./provision.sh

devstack.reset: ## Remove all service containers
	docker-compose down

devstack.start: clone ## Start all services
	docker-compose up

devstack.stop: ## Stop all services
	docker-compose stop

requirements: ## Install requirements
	pip install -r requirements.txt

validate: ## Validate the devstack configuration
	docker-compose config
