help-registrar: ## Display this help message
	@echo "Please use \`make <target>' where <target> is one of"
	@perl -nle'print $& if m{^[\.a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | grep registrar | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m  %-25s\033[0m %s\n", $$1, $$2}'

registrar-clone:  ## Clone registrar repository
	git clone https://github.com/edx/registrar ../registrar

registrar-pull:  ## Pulls latest version of all Docker images including Registrar
	docker-compose -f docker-compose.yml -f docker-compose-registrar.yml pull

registrar-shell: ## Run a shell on the registrar site container
	docker exec -it edx.devstack.registrar env TERM=$(TERM) bash -c 'source /edx/app/registrar/registrar_env && cd /edx/app/registrar/registrar && /bin/bash'

stop-registrar:   ## Stop all services (including the registrar site) with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-registrar.yml -f docker-compose-registrar-host.yml stop

down-registrar:   ## Bring down all services (including the registrar site) with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-registrar.yml -f docker-compose-registrar-host.yml down

up-registrar:   ## Bring up all services (including the registrar site) with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-registrar.yml -f docker-compose-registrar-host.yml up

up-registrar-detached:   ## Bring up all services (including the registrar site) with host volumes (in detached mode)
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-registrar.yml -f docker-compose-registrar-host.yml up -d

up-registrar-sync:  ## Bring up all services (including the registrar site) with docker-sync
	docker-sync-stack start -c docker-sync-registrar.yml

clean-registrar-sync:   ## Remove the docker-sync containers for all services (including the registrar site)
	docker-sync-stack clean -c docker-sync-registrar.yml

registrar-setup: registrar-requirements registrar-create-db registrar-update-db registrar-create-superuser registrar-provision-ida-user registrar-static  ## Set up Registrar development environment

registrar-requirements:  ## Install requirements for registrar service
	docker exec -it edx.devstack.registrar env TERM=$(TERM) bash -c 'source /edx/app/registrar/registrar_env && cd /edx/app/registrar/registrar && make requirements'

registrar-create-db:  ## Ensure that the Registrar database is created
	docker exec -i edx.devstack.mysql mysql -uroot mysql < provision.sql
	@# We just re-run provision.sql. This only has an effect on devstacks
	@# that were provisioned before Registrar was introduced

registrar-provision-ida-user:  ## Provisions a service user for Registrar
	./provision-ida-user.sh registrar registrar 18734

registrar-create-superuser:  ## Create admin user with username/password of edx/edx
	docker exec -t edx.devstack.registrar bash -c 'source /edx/app/registrar/registrar_env && cd /edx/app/registrar/registrar && make createsuperuser'

registrar-logs:  ## View logs for registrar
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-registrar.yml -f docker-compose-registrar-host.yml logs -f --tail=500 registrar

registrar-worker-logs:  ## View logs for registrar-worker
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-registrar.yml -f docker-compose-registrar-host.yml logs -f --tail=500 registrar-worker
