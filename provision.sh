#!/usr/bin/env bash

# This script will provision all of the services. Each service will be setup in the following manner:
#
# 1. Migrations run,
# 2. Tenants—as in multi-tenancy—setup,
# 3. Service users and OAuth clients setup in LMS,
# 4. Static assets compiled/collected.


set -e
set -o pipefail
set -x

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# before provisioning steps
./provision-db.sh

# Provisioning steps
./provision-lms.sh
# Nothing special needed for studio
docker-compose $DOCKER_COMPOSE_FILES up -d studio
./provision-ecommerce.sh
./provision-discovery.sh
./provision-credentials.sh
./provision-e2e.sh
./provision-forum.sh

docker image prune -f

echo -e "${GREEN}Provisioning complete!${NC}"
