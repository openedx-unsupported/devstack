
edraak.buildall:
	$(MAKE) progs.build
	$(MAKE) mktg.build

# Common commands for all services

%.restart:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` restart $*

%.start:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` start $*

%.stop:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` stop $*

%.provision:
	./provision-$*.sh

%.shell:
	docker-compose `echo ${DOCKER_COMPOSE_FILES}` exec $* bash

%.logs:
	docker-compose ${DOCKER_COMPOSE_FILES} logs -f --tail=100 $*
