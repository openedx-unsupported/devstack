# DEFAULT DEVSTACK OPTIONS
# Included into Makefile and exported to command environment.
# Defaults are listed in this file.
# Local git-ignored overrides can be configured by creating `options.local.mk`.

# WHEN ADDING NEW OPTIONS TO THIS FILE:
# * Provide an explanation of what the option is for.
# * Explain what values it can be overriden to.
# * Set the default value with `?=` to allow.
#   This prevents us from clobbering the value if it is already defined,
#   allowing overrides to be passed in via the command line.

# Folder in which we looks for repositories.
# Defaults to parent of this repository.
DEVSTACK_WORKSPACE ?= $(shell pwd)/..

# Name of Docker Compose project.
# Volumes and network are namespaced based on this value,
# so changing it will give you a separate set of databases.
# See https://docs.docker.com/compose/reference/envvars/#compose_project_name
# Defaults to 'devstack' should OPENEDX_RELEASE not be defined.
# Bring down services before changing the value of `COMPOSE_PROJECT_NAME`.
ifdef OPENEDX_RELEASE
	COMPOSE_PROJECT_NAME ?= devstack-${OPENEDX_RELEASE}
else
	COMPOSE_PROJECT_NAME ?= devstack
endif

# Docker Compse HTTP timeout, in seconds.
# By default, increased so that devstack provisioning does not fail in unstable networks.
COMPOSE_HTTP_TIMEOUT ?= 180

# Whether we should always copy programs to LMS cache upon LMS startup.
# If 'true', then run `make dev.cache-programs` whenever we bring up
# containers.
# Defaults to false. Case-sensitive.
ALWAYS_CACHE_PROGRAMS ?= false

# FileSystem Synchronization Strategy.
# How should we synchronize files between the host machine and the Docker containers?
# Options are 'local-mount', 'nfs', and 'docker-sync'.
# Note that 'local-mount' is the most tested and supported with edX's Devstack
# and 'docker-sync' the least.
FS_SYNC_STRATEGY ?= local-mounts

# All edX services, whether or not they are run by default.
# Separated by plus signs.
# Separated by plus signs. Listed in alphabetical order for clarity.
EDX_SERVICES ?= \
analyticspipeline+credentials+discovery+ecommerce+edx_notes_api+forum+frontend-app-learning+frontend-app-publisher+gradebook+lms+lms_watcher+marketing+program-console+registrar+registrar-worker+studio+studio_watcher+xqueue+xqueue_consumer

# Services with database migrations.
# Should be a subset of $(EDX_SERVICES).
# Separated by plus signs. Listed in alphabetical order for clarity.
# Services must provide a Makefile target named: $(service)-update-db
# Note: This list should contain _all_ db-backed services, even if not
# configured to run; the list will be filtered later against $(DEFAULT_SERVICES).
DB_SERVICES ?= \
credentials+discovery+ecommerce+lms+registrar+studio

# Services with static assets to be built.
# Should be a subset of $(EDX_SERVICES).
# Services must provide a Makefile target named: dev.migrate.$(service)
# Separated by plus signs. Listed in alphabetical order for clarity.
# Note: This list should contain _all_ services with static asse to compile ts, even if not
# configured to run; the list will be filtered later against $(DEFAULT_SERVICES).
ASSET_SERVICES ?= \
credentials+discovery+ecommerce+lms+registrar+studio

# Services that are to be pulled, provisioned, run, and checked by default
# when no services are specified manually.
# Should be a subset of $(EDX_SERVICES).
# Separated by plus signs. Listed in alphabetical order for clarity.
# TODO: Re-evaluate this list and consider paring it down to a tighter core.
#       The current value was chosen such that it would not change the existing
#       Devstack behavior.
DEFAULT_SERVICES ?= \
credentials+discovery+ecommerce+edx_notes_api+forum+frontend-app-publisher+frontend-app-learning+gradebook+lms+program-console+registrar+studio

# All third-party services.
# Separated by plus signs. Listed in alphabetical order for clarity.
THIRD_PARTY_SERVICES ?= \
chrome+devpi+elasticsearch+elasticsearch-5+firefox+memcached+mongo+mysql+mysql57+redis+namenode+datanode+resourcemanager+nodemanager+sparkmaster+sparkworker+vertica

# Include local overrides to options.
# You can use this file to configure your Devstack. It is ignored by git.
-include options.local.mk  # Prefix with hyphen to tolerate absence of file.
