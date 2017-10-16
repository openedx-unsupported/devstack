help-marketing: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | grep marketing | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

marketing-shell: ## Run a shell on the marketing site container
	docker exec -it edx.devstack.marketing env TERM=$(TERM) bash

stop-marketing:   ## Stop all services (including the marketing site) with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-marketing-site.yml -f docker-compose-marketing-site-host.yml stop

down-marketing:   ## Bring down all services (including the marketing site) with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-marketing-site.yml -f docker-compose-marketing-site-host.yml down

up-marketing:   ## Bring up all services (including the marketing site) with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-marketing-site.yml -f docker-compose-marketing-site-host.yml up

up-marketing-detached:   ## Bring up all services (including the marketing site) with host volumes (in detached mode)
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-marketing-site.yml -f docker-compose-marketing-site-host.yml up -d

up-marketing-sync:  ## Bring up all services (including the marketing site) with docker-sync
	docker-sync-stack start -c docker-sync-marketing-site.yml

clean-marketing-sync:   ## Remove the docker-sync containers for all services (including the marketing site)
	docker-sync-stack clean -c docker-sync-marketing-site.yml
