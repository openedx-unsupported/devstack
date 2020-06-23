# This Makefile exists entirely to support old targets that were once
# part of the documented Devstack interface but no longer are.
# This file allows us to remove old targets from the main Makefile
# (thus making it easier to read and making the `make help` message cleaner)
# while avoiding breaking backwards-compatibility with developers' existing workflows.

# In order to keep this file simple and predictable, please follow these rules
# when adding targets:
#  * If a target has a body, all it should do is echo a message to the user
#    explaining that the command is deprecated.
#    If the target's functionliaty cannnot be expressed entirely using dependencies,
#    then it probably shouldn't be here.
#  * Dependencies should be from the main Makefile, not this one.
#    That'll keep it easier for us to remove targets altogether if we wish to.
#  * Keep targets in alphabetical order.

.PHONY: analytics-pipeline-shell backup check-memory destroy \
        dev.provision.analytics_pipeline dev.repo.reset dev.up.all \
        dev.up.analytics_pipeline dev.up.watchers down down-marketing \
        e2e-shell healthchecks help-marketing lms-restart lms-watcher-shell \
        logs provision pull pull.analytics_pipeline pull.xqueue restore static \
        stats stop stop.all stop.analytics_pipeline stop-marketing \
        stop.watchers stop.xqueue studio-restart studio-watcher-shell \
        up-marketing up-marketing-detached validate xqueue_consumer-restart \
        xqueue-restart

#####################################################################
# Generic tagets.
#####################################################################

$(addsuffix -update-db, $(DB_SERVICES_LIST)): %-update-db: %-migrate

$(addprefix mysql-shell-, $(DB_SERVICES_LIST)): mysql-shell-%: %-dbshell

$(addprefix healthchecks., $(EDX_SERVICES_LIST)): healthchecks.%: dev.check.%

$(addprefix dev.provision.services., $(EDX_SERVICES_LIST)): dev.provision.services.%: dev.provision.%


#####################################################################
# Non-generic tagets.
#####################################################################

studio-watcher-shell: dev.shell.studio_watcher

lms-watcher-shell: dev.shell.lms_watcher

lms-restart: dev.restart-devserver.lms

studio-restart: dev.restart-devserver.studio

xqueue-restart: dev.restart-devserver.xqueue

xqueue_consumer-restart: dev.restart-devserver.xqueue_consumer

dev.up.all: dev.up.with-watchers

stop.all: dev.stop

stop.xqueue: dev.stop.xqueue+xqueue_consumer

stop.watchers: dev.stop.lms_watcher+studio_watcher

pull.xqueue: dev.pull.without-deps.xqueue+xqueue_consumer

dev.provision.analytics_pipeline: dev.provision.analyticspipeline

analytics-pipeline-shell: dev.shell.analyticspipeline

dev.up.analytics_pipeline: dev.up.analyticspipeline

pull.analytics_pipeline: dev.pull.analyticspipeline

stop.analytics_pipeline: dev.stop.namenode+datanode+resourcemanager+nodemanager+sparkmaster+sparkworker+vertica+analyticspipeline

dev.repo.reset: dev.reset-repos

dev.up.watchers: dev.up.lms_watcher+studio_watcher

provision: dev.provision

logs: dev.logs

down: dev.down

e2e-shell: e2e-tests.with-shell

stop: dev.stop

backup: dev.backup

restore: dev.restore

validate: dev.validate

destroy: dev.destroy

healthchecks: dev.check

pull: dev.pull

stats: dev.stats

static: dev.static

check-memory: dev.check-memory

stop-marketing: dev.stop

down-marketing: dev.down

up-marketing-detached: dev.up.$(DEFAULT_SERVICES)+marketing

up-marketing: dev.up.attach.marketing

help-marketing:
	@echo "This command is deprecated."
	@echo "All Marketing Site commands can be expressed using the standard Devstack command format."
	@echo "For example, 'make dev.up.marketing' brings up the Marketing Site service,"
	@echo "and 'make dev.shell.marketing' creates a shell into it."
