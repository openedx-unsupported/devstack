# DEFAULT DEVSTACK OPTIONS
# Included into Makefile and exported to command environment.
# Defaults are listed in this file.
# Local git-ignored overrides can be configured by creating `options.local.mk`.
# Variables are set here with ?= to allow for overriding them on the command line.

# Folder in which we looks for repositories.
# Defaults to parent.
DEVSTACK_WORKSPACE ?= $(shell pwd)/..

# Name of Docker Compose project.
# See https://docs.docker.com/compose/reference/envvars/#compose_project_name
# Defaults to 'devstack'.
COMPOSE_PROJECT_NAME ?= devstack

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
DEFAULT_SERVICES ?= lms+studio+ecommerce+discovery+credentials+forum+edx_notes_api+registrar
