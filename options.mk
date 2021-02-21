# DEFAULT DEVSTACK OPTIONS
# Included into Makefile and exported to command environment.
# Defaults are listed in this file.
# Local git-ignored overrides can be configured by creating `options.local.mk`.
# Variables are set here with ?= to allow for overriding them on the command line.

# Folder in which we looks for repositories.
# Defaults to parent.
DEVSTACK_WORKSPACE ?= $(shell pwd)/..

# Name of Docker Compose project.
# Volumes and network are namespaced based on this value,
# so changing it will give you a separate set of databases.
# See https://docs.docker.com/compose/reference/envvars/#compose_project_name
# If OPENEDX_RELAESE is defined, defaults to `devstack-${OPENEDX_RELEASE}`;
# otherwise, it defaults to `devstack`.
# Be sure to bring down services before changing the value of `COMPOSE_PROJECT_NAME`.
ifdef OPENEDX_RELEASE
	COMPOSE_PROJECT_NAME ?= devstack-${OPENEDX_RELEASE}
else
	COMPOSE_PROJECT_NAME ?= devstack
endif

# Name of Docker Compose project.
# See https://docs.docker.com/compose/reference/envvars/#compose_project_name
# Defaults to 'devstack'.
COMPOSE_PROJECT_NAME ?= devstack

# increase Docker Compose HTTP timeout so that devstack provisioning does not fail in unstable networks
COMPOSE_HTTP_TIMEOUT=180

# Whether we should always copy programs to LMS cache upon LMS startup.
# If 'true', then run `make dev.cache-programs` whenever we bring up
# containers.
# Defaults to false.
ALWAYS_CACHE_PROGRAMS ?= false

# FileSystem Synchronization Strategy.
# How should we synchronize files between the host machine and the Docker containers?
# Options are 'local-mount', 'nfs', and 'docker-sync'.
# Note that 'local-mount' is the most tested and supported with edX's Devstack
# and 'docker-sync' the least.
FS_SYNC_STRATEGY ?= local-mounts

# Services that are pulled, provisioned, run, and checked by default
# when no services are specified manually.
# TODO: Re-evaluate this list and consider paring it down to a tighter core.
#       The current value was chosen such that it would not change the existing
#       Devstack behavior.
DEFAULT_SERVICES ?= lms+studio+credentials+forum+amc+amc-frontend

# List of all services with database migrations.
# Services must provide a Makefile target named: $(service)-update-db
# Note: This list should contain _all_ db-backed services, even if not
# configured to run; the list will be filtered later against $(DEFAULT_SERVICES)
DB_SERVICES ?= credentials discovery ecommerce lms registrar studio amc

# List of Makefile targets to run database migrations, in the form $(service)-update-db
# Services will only have their migrations added here
# if the service is present in both $(DEFAULT_SERVICES) and $(DB_SERVICES).
DB_MIGRATION_TARGETS = $(foreach db_service,$(DB_SERVICES),\
	$(if $(filter $(db_service),$(subst +, ,$(DEFAULT_SERVICES))),\
		$(db_service)-update-db))
