marketing-shell: ## Run a shell on the marketing site container
	docker exec -it edx.devstack.marketing env TERM=$(TERM) bash

up-marketing:   ## Bring up all services (including the marketing site) with host volumes
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-marketing-site.yml -f docker-compose-marketing-site-host.yml up

up-marketing-detached:   ## Bring up all services (including the marketing site) with host volumes (in detached mode)
	docker-compose -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-marketing-site.yml -f docker-compose-marketing-site-host.yml up -d

up-marketing-sync:  ## Bring up all services (including the marketing site) with docker-sync
	docker-sync-stack start -c docker-sync-marketing-site.yml

clean-marketing-sync:   ## Remove the docker-sync containers for all services (including the marketing site)
	docker-sync-stack clean -c docker-sync-marketing-site.yml

create-course-marketing: ## Generates a course on the marketing site using the configurations in test-course.json
	./course-generator/create-course-marketing.sh ./course-generator/test-course.json
