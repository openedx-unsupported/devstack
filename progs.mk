progs.help:
	@echo ""
	@echo "make progs.COMMAND"
	@echo "======================================"
	@echo ""
	@echo "Commands:"
	@echo "build:                Build the docker image"
	@echo "pushimage:            Push the docker image to the shared container repository"
	@echo "migrate:              Run django migrations i.e. python manage.py migrate"
	@echo "langs_push:           Run django langs_push command i.e. python manage.py langs_push"
	@echo "langs_pull:           Run django langs_pull command i.e. python manage.py langs_pull"
	@echo "install_pip:          Install python dependencies in 'requirements.txt' file"
	@echo "install_npm:          Install npm dependencies in 'package.json' file"
	@echo "copy_cache:           Copy node_modules, installed at build time, to the current app"
	@echo "dev:                  Run npm run dev command"
	@echo "watch:                Run gulp watch"
	@echo "install_all:          Runs install_pip, install_npm, dev, migrate"
	@echo "watch_js:             Run watcher to watch JavaScript changes"
	@echo "watch_css:            Run watcher to watch and compile scss changes"
	@echo "shell:                Open bash shell inside docker container"
	@echo "provision:            Run provision script, prepare the env"
	@echo "restart:              Restart the container"
	@echo "manage <Command>:     Run any manage.py command"
	@echo "fix-npm:              Fix .npm folder ownership issue"
	@echo "help:                 Print help and exit"
	@echo ""

progs.build:
	docker build -t eu.gcr.io/openedx-231314/edraak/progs -f ../edraak-programs/Dockerfile ../edraak-programs

progs.pushimage:
	docker push eu.gcr.io/openedx-231314/edraak/progs

progs.migrate:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs python manage.py migrate --settings=edraakprograms.dev

progs.langs_push:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs python manage.py langs_push --settings=edraakprograms.dev

progs.langs_pull:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs python manage.py langs_pull --settings=edraakprograms.dev

progs.install_pip:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs pip install -r requirements.txt

progs.install_npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs npm install

progs.copy_cache:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs cp -Rnv /cache/node_modules /cache/.compiled /app

progs.dev:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs npm run dev

progs.watch:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs npx gulp watch

progs.install_all: | progs.install_pip progs.install_npm progs.dev progs.migrate

progs.watch_js:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs npm run dev:watch

progs.watch_css:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs npm run watch-scss

progs.fix-npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec progs bash -c 'chown -R root ~/.npm'

