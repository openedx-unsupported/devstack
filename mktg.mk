mktg.help:
	@echo ""
	@echo "make mktg.COMMAND"
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
	@echo "shell:                Open bash shell inside docker container"
	@echo "provision:            Run provision script, prepare the env"
	@echo "restart:              Restart the container"
	@echo "fix-npm:              Fix .npm folder ownership issue"
	@echo "help:                 Print help and exit"
	@echo ""


mktg.build:
	docker build -t eu.gcr.io/openedx-231314/edraak/marketing -f ../marketing-site/Dockerfile ../marketing-site

mktg.pushimage:
	docker push eu.gcr.io/openedx-231314/edraak/marketing

mktg.migrate: ## Kill the Marketing Django development server. The watcher process will restart it.
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg bash -c 'python manage.py migrate --settings=marketingsite.envs.dev'

mktg.makemigrations: ## Kill the Marketing Django development server. The watcher process will restart it.
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg bash -c 'python manage.py makemigrations --settings=marketingsite.envs.dev'

mktg.langs_push:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg python manage.py langs_push --settings=marketingsite.envs.dev

mktg.langs_pull:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg python manage.py langs_pull --settings=marketingsite.envs.dev

mktg.install_pip:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg pip install -r requirements.txt

mktg.install_npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg npm install

mktg.copy_cache:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg cp -Rnv /cache/node_modules /cache/.compiled /app

mktg.dev:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg npm run dev

mktg.watch:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg npx gulp watch

mktg.install_all: | mktg.install_pip mktg.install_npm mktg.dev mktg.migrate

mktg.fix-npm:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg bash -c 'chown -R root ~/.npm'

mktg.django_shell: ## Kill the Marketing Django development server. The watcher process will restart it.
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec mktg bash -c 'python manage.py shell --settings=marketingsite.envs.dev'