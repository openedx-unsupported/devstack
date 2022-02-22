b2b.help:
	@echo ""
	@echo "make b2b.COMMAND"
	@echo "======================================"
	@echo ""
	@echo "Commands:"
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

b2b.migrate:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b python manage.py migrate --settings=edraakprograms.dev

b2b.langs_push:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b python manage.py langs_push --settings=edraakprograms.dev

b2b.langs_pull:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b python manage.py langs_pull --settings=edraakprograms.dev

b2b.install_pip:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b pip install -r requirements.txt

b2b.install_npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b npm install

b2b.copy_cache:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b cp -Rnv /cache/node_modules /cache/.compiled /app

b2b.dev:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b npm run dev

b2b.watch:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b npm run dev:watch

b2b.install_all: | b2b.install_pip b2b.install_npm b2b.dev b2b.migrate

b2b.watch_js:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b npm run dev:watch

b2b.watch_css:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b npm run scss:watch

b2b.fix-npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b bash -c 'chown -R root ~/.npm'

b2b.createsuperuser:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b python manage.py createsuperuser --settings=edraakprograms.dev

b2b.css:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b npm run scss

b2b.makemessages:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b python manage.py makemessages --settings=edraakprograms.dev

b2b.compilemessages:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec b2b python manage.py compilemessages --settings=edraakprograms.dev

