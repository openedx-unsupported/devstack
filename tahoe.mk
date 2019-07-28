DEVSTACK_WORKSPACE ?= ..

tahoe.exec.single:  ## Execute a command inside a devstack docker container
	docker exec -t edx.devstack.$(SERVICE)  \
		bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && $(COMMAND)'

tahoe.exec.edxapp:   ## Execute a command in both LMS and Studio (edxapp containers)
	make COMMAND='$(COMMAND)' SERVICE=lms tahoe.exec.single
	make COMMAND='$(COMMAND)' SERVICE=studio tahoe.exec.single

tahoe.chown:  ## Fix annoying docker permission issues
	sudo chown -R $(USER) $(DEVSTACK_WORKSPACE)

tahoe.provision:  ## Make the devstack more Tahoe'ish
	make tahoe.chown
	cat $(DEVSTACK_WORKSPACE)/devstack/provision-tahoe.py > $(DEVSTACK_WORKSPACE)/src/provision-tahoe.py
	make COMMAND='python /edx/src/provision-tahoe.py' tahoe.exec.edxapp
	rm $(DEVSTACK_WORKSPACE)/src/provision-tahoe.py

tahoe.up:  ## Run the lightweight devstack with proper Tahoe settings, use instead of `$ make dev.up`
	make dev.up
	make tahoe.provision
	make tahoe.chown

tahoe.envs._delete:  ## Remove settings, in prep for resetting it
	sudo rm -rf $(DEVSTACK_WORKSPACE)/src/edxapp-envs

tahoe.restart:  ## Restarts both of LMS and Studio python processes while keeping the same container
	make lms-restart
	make studio-restart
	make amc-restart

amc.provision:  ## Initializes the AMC
	docker exec -it tahoe.devstack.amc python manage.py migrate
	docker exec -it tahoe.devstack.amc python manage.py create_devstack_superuser
	cd $(DEVSTACK_WORKSPACE)/amc/frontend && npm install

amc-shell:
	docker exec -it tahoe.devstack.amc bash

amc-frontend-shell:
	@echo "AMC frontend is running in your local machine"

amc-restart:
	docker exec -t tahoe.devstack.amc bash -c 'killall5'
	@echo "Note: AMC frontend is running in your local machine"

amc.start.frontend:
	@echo "Running AMC frontend  in your local machine"
	cd $(DEVSTACK_WORKSPACE)/amc/frontend && npm start

tahoe.macosx.install-nodejs-v10:
	brew install node@10
	brew link --overwrite --force node@10

amc.check-node-version:
	node --version $(DEVNULL)
ifneq ($(shell node --version | grep -o '^v10\.'), v10.)
	@echo "AMC needs Node.js v10, no more no less."
	@echo "You DO NOT have Node.js v10 installed. Please install it."
	@echo "Try running '$ make tahoe.macosx.install-nodejs-v10' on MacOSX."
	@exit 1
endif

tahoe.clean-provision:
	make amc.check-node-version
	make down
	make tahoe.chown
	docker volume prune --force

	@# Ignoring AMC since we're building it locally.
	docker-compose pull lms studio devpi memcached mongo mysql postgres redis

	cd $(DEVSTACK_WORKSPACE) && \
		rm -rf amc && \
		rm -rf course-discovery && \
		rm -rf credentials && \
		rm -rf cs_comments_service && \
		rm -rf ecommerce && \
		rm -rf edx-analytics-pipeline && \
		rm -rf edx-e2e-tests && \
		rm -rf edx-notes-api && \
		rm -rf edx-platform && \
		rm -rf edx-theme-codebase && \
		rm -rf edx-theme-customers && \
		rm -rf src && \
		rm -rf xqueue

	make dev.clone

	cd $(DEVSTACK_WORKSPACE)/amc && \
		docker build -f Dockerfile . -t gcr.io/appsembler-tahoe-0/amc

	make dev.provision
	@echo "Provisioning Tahoe is now complete. Please run the following command to start the AMC frontend (outside the Docker devstack: '$ make amc.start.frontend')"

