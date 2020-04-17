# DEFAULT DEVSTACK OPTIONS
# Included into Makefile and exported to command environment.
# Defaults are listed in this file.
# For configuring your local Devstack, create a file called
# 'options.local.mk' and add your preferred overrides.

# Folder in which we looks for repositories.
# Defaults to parent.
DEVSTACK_WORKSPACE ?= $(shell pwd)/..

# Name of Docker Compose project.
# See https://docs.docker.com/compose/reference/envvars/#compose_project_name
# Defaults to 'devstack'.
COMPOSE_PROJECT_NAME=devstack

# Set of Docker Compose YAML files that we use for normal commands.
STANDARD_COMPOSE_FILES=-f docker-compose.yml -f docker-compose-host.yml -f docker-compose-themes.yml

# Set of Docker Compose YAML files that we use for NFS commands.
NFS_COMPOSE_FILES=-f docker-compose.yml -f docker-compose-host-nfs.yml -f docker-compose-themes-nfs.yml

# increase Docker Compose HTTP timeout so that devstack provisioning does not fail in unstable networks
COMPOSE_HTTP_TIMEOUT=180

# Whether we should always copy programs to LMS cache upon LMS startup.
# If 'true', then run `make dev.cache-programs` whenever we bring up
# containers.
# Defaults to false.
ALWAYS_CACHE_PROGRAMS=false

# Load local overrides to options.
# The dash in front of 'include' makes it so we don't
# fail if the overrides file doesn't exist.
-include options.local.mk
