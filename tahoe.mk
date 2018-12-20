DEVSTACK_WORKSPACE ?= ..
THEMES_DIR = $(DEVSTACK_WORKSPACE)/src/themes
CUSTOMER_THEME_DIR = $(THEMES_DIR)/edx-theme-codebase/customer_specific

tahoe.exec.single:  ## Execute a command inside a devstack docker container
	docker exec -t edx.devstack.$(SERVICE)  \
		bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && $(COMMAND)'

tahoe.exec.edxapp:   ## Execute a command in both LMS and Studio (edxapp containers)
	make COMMAND='$(COMMAND)' SERVICE=lms tahoe.exec.single
	make COMMAND='$(COMMAND)' SERVICE=studio tahoe.exec.single

tahoe.install-pip.edxapp:  ## Install a pip package in both of LMS and Studio
	make COMMAND='pip install $(PACKAGE)' SERVICE=lms tahoe.exec.single
	make COMMAND='pip install $(PACKAGE)' SERVICE=studio tahoe.exec.single

tahoe.chown.dir:  # Fix permissions for a single directory
	find $(DIRECTORY) \! -user $(USER) -print -exec sudo chown -R $(USER) {} \;

tahoe.chown:  ## Fix an annoying docker permission issue in both `edx-platform` and `src`
	make DIRECTORY='$(DEVSTACK_WORKSPACE)/edx-platform/' tahoe.chown.dir
	make DIRECTORY='$(DEVSTACK_WORKSPACE)/src/' tahoe.chown.dir

tahoe.theme.compile:  ## Compile the static assets of the theme
	make COMMAND='make requirements' tahoe.exec.edxapp
	make lms-static
	make studio-static

tahoe.theme.clone:  ## Clone the theme with Tahoe branches
	make tahoe.chown
	rm -rf $(THEMES_DIR)

	git clone git@github.com:appsembler/edx-theme-codebase.git $(THEMES_DIR)/edx-theme-codebase
	cd $(THEMES_DIR)/edx-theme-codebase && git checkout hawthorn/master

	git clone git@github.com:appsembler/edx-theme-customers.git $(CUSTOMER_THEME_DIR)
	cd $(CUSTOMER_THEME_DIR) && git checkout hawthorn/amc

	make tahoe.chown

tahoe.init.provision-script:  ## Execute the `provision-tahoe.py` script in both of LMS and Studio
	cat $(DEVSTACK_WORKSPACE)/devstack/provision-tahoe.py > $(DEVSTACK_WORKSPACE)/src/provision-tahoe.py
	make COMMAND='python /edx/src/provision-tahoe.py' tahoe.exec.edxapp
	rm $(DEVSTACK_WORKSPACE)/src/provision-tahoe.py

tahoe.init:  ## Make the devstack more Tahoe'ish
	make tahoe.init.provision-script
	# TODO: Install within the Tahoe Open edX images
	make PACKAGE='git+https://github.com/appsembler/edx-organizations.git@0.4.10-appsembler3' tahoe.install-pip.edxapp
	make tahoe.restart || true

tahoe.up:  ## Run the devstack with proper Tahoe settings, use instead of `$ make dev.up`
	make tahoe.chown
	make dev.up
	@sleep 1
	make tahoe.init
	test -d $(CUSTOMER_THEME_DIR) || (make tahoe.theme.clone && tahoe.theme.compile)
	make tahoe.chown

tahoe.reset.light:  ## Resets the Tahoe settings including a fresh theme copy and new environment files.
	make down
	sudo rm -rf $(DEVSTACK_WORKSPACE)/src/edxapp-envs
	make tahoe.theme.clone
	@sleep 1
	make tahoe.up
	make tahoe.theme.compile

tahoe.reset.full:  ## Does a full reset for everything known to devstack. Will loose all git and database changes.
	make dev.reset
	make tahoe.reset.light

tahoe.restart:  ## Restarts both of LMS and Studio python processes while keeping the same container
	make lms-restart
	make studio-restart
