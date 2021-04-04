edraak.provision:
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" ./provision-edraak.sh

edraak.sync.provision: | dev.sync.daemon.start
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-state-manager.yml -f docker-compose-sync.yml" ./provision-edraak.sh

edraak.build.all:
	$(MAKE) edraak.build.programs
	$(MAKE) edraak.build.marketing

edraak.build.programs:
	docker build -t eu.gcr.io/openedx-231314/edraak/progs -f ../edraak-programs/Dockerfile ../edraak-programs

edraak.build.marketing:
	docker build -t eu.gcr.io/openedx-231314/edraak/marketing -f ../marketing-site/Dockerfile ../marketing-site

edraak.programs.help:
	echo ""
	echo "make edraak.programs.COMMAND"
	echo "======================================"
	echo ""
	echo "Commands:"
	echo ""
	echo "migrate:              Run django migrations i.e. python manage.py migrate"
	echo "install_pip:          Install python dependencies in 'requirements.txt' file"
	echo "install_npm:          Install npm dependencies in 'package.json' file"
	echo "dev:                  Run npm run dev command"
	echo "install_all:          Runs install_pip, install_npm, migrate"
	echo "watch_js:             Run watcher to watch JavaScript changes"
	echo "watch_css:            Run watcher to watch and compile scss changes"
	echo "manage:               Run any manage.py command"
	echo "shell:                Open bash inside docker container"
	echo "copy_cache:           Copy node_modules, installed at build time, to the current app"
	echo "help:                 Print help and exit"
	echo ""

edraak.programs.migrate:
	docker-compose exec progs python manage.py migrate --settings=edraakprograms.dev

edraak.programs.langs_push:
	docker-compose exec progs python manage.py langs_push --settings=edraakprograms.dev

edraak.programs.langs_pull:
	docker-compose exec progs python manage.py langs_pull --settings=edraakprograms.dev

edraak.programs.install_pip:
	docker-compose exec progs pip install -r requirements.txt

edraak.programs.install_npm:
	docker-compose exec progs npm install

edraak.programs.copy_cache:
	docker-compose exec progs cp -Rnv /cache/node_modules /cache/.compiled /app

edraak.programs.dev:
	docker-compose exec progs npm run dev

edraak.programs.watch:
	docker exec -t progs bash -c 'while true; do npx gulp watch; sleep 2; done'

edraak.marketing.watch:
	docker exec -t edraak.devstack.marketing bash -c 'while true; do npx gulp watch; sleep 2; done'

edraak.programs.install_all:
	$(MAKE) edraak.programs.copy_cache
	$(MAKE) edraak.programs.dev
	$(MAKE) edraak.programs.migrate

edraak.programs.watch_js:
	docker-compose exec progs npm run dev:watch

edraak.programs.provision:
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" ./provision-edraak-programs.sh

edraak.programs.watch_css:
	docker-compose exec progs npm run watch-scss

edraak.programs.shell:
	docker-compose exec progs bash

edraak.marketing.shell:
	docker-compose exec edraak_marketing bash

edraak.marketing.provision:
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" ./provision-edraak-marketing.sh

edraak.states.provision:
	DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-state-manager.yml -f docker-compose-host.yml" ./provision-edraak-state-manager.sh

marketing-restart: ## Kill the Marketing Django development server. The watcher process will restart it.
	docker exec -t edraak.devstack.marketing bash -c 'kill $$(ps aux | grep "manage.py" | egrep -v "while|grep" | awk "{print \$$2}")'

judge-restart: ## Kill the Marketing Django development server. The watcher process will restart it.
	docker exec -t edraak.devstack.judge bash -c 'kill $$(ps aux | grep "gunicorn" | egrep -v "while|grep" | awk "{print \$$2}")'

state_manager-restart: ## Kill the state-manager development server. The watcher process will restart it.
	docker exec -t edraak.devstack.state_manager bash -c 'kill $$(ps aux | grep "gunicorn" | egrep -v "while|grep" | awk "{print \$$2}")'

edraak.marketing.migrate: ## Kill the Marketing Django development server. The watcher process will restart it.
	docker-compose exec edraak_marketing bash -c 'python manage.py migrate --settings=marketingsite.envs.dev'

edraak.marketing.langs_push:
	docker-compose exec edraak_marketing python manage.py langs_pull --settings=marketingsite.envs.dev


programs-restart: ## Kill the Edraak Programs Django development server. The watcher process will restart it.
	docker exec -t progs bash -c 'kill $$(ps aux | grep "manage.py" | egrep -v "while|grep" | awk "{print \$$2}")'


programs-fix-npm-install-permissions:
	docker-compose exec progs bash -c 'chown -R root ~/.npm'

marketing_gulp-restart:
	docker exec -t edraak.devstack.marketing-gulp bash -c 'kill $$(ps aux | grep "gulp" | egrep -v "while|grep" | awk "{print \$$2}")'


edraak.restart:  ## Restart all of the lms, studio, marketing and progs
	make marketing-restart
	make programs-restart
	make lms-restart
	make studio-restart
	make state_manager-restart
