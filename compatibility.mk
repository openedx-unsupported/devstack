# This Makefile exists entirely to support old targets that were once
# part of the documented Devstack interface but no longer are.
# This file allows us to remove old targets from the main Makefile
# (thus making it easier to read and making the `make help` message cleaner)
# while avoiding breaking backwards-compatibility with developers' existing workflows.

# Housekeeping Rules:
# * Organize targets into Parameterized and Simple. Alphabetize within those sections.
# * Keep target definitions simple. Ideally, targets in this file are just aliases to
#   equivalent commands in the main Makefile.

# All devstack targets are "PHONY" in that they do not name actual files.
# Thus, all non-parameterized targets should be added to this declaration.
.PHONY: backup check-memory destroy \
        dev.provision.services dev.repo.reset \
        dev.up.all dev.up.watchers down \
        healthchecks lms-restart \
        lms-watcher-shell logs provision pull  \
        pull.xqueue restore static stats stop stop.all  \
        stop.watchers stop.xqueue cms-restart \
        cms-watcher-shell validate \
        xqueue_consumer-restart xqueue-restart

#####################################################################
# Parameterized tagets.
#####################################################################

dev.provision.services.%:
	make dev.provision.$*

healthchecks.%:
	make dev.check.$*

mysql-shell-%:
	make dev.dbshell.$*

%-update-db:
	make dev.migrate.$*

#####################################################################
# Simple tagets.
#####################################################################

backup: dev.backup

check-memory: dev.check-memory

destroy: dev.destroy

dev.provision.services: dev.provision

dev.repo.reset: dev.reset-repos

dev.up.all: dev.up.with-watchers

dev.up.watchers: dev.up.lms_watcher+cms_watcher

down: dev.down

healthchecks: dev.check

lms-restart: dev.restart-devserver.lms

lms-watcher-shell: dev.shell.lms_watcher

logs: dev.logs

provision: dev.provision

pull: dev.pull

pull.xqueue: dev.pull.without-deps.xqueue+xqueue_consumer

restore: dev.restore

static: dev.static

stats: dev.stats

stop.all: dev.stop

stop: dev.stop

stop.watchers: dev.stop.lms_watcher+cms_watcher

stop.xqueue: dev.stop.xqueue+xqueue_consumer

cms-restart: dev.restart-devserver.cms

cms-watcher-shell: dev.shell.cms_watcher

validate: dev.validate

xqueue_consumer-restart: dev.restart-devserver.xqueue_consumer

xqueue-restart: dev.restart-devserver.xqueue
