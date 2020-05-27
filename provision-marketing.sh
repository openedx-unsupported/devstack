#!/usr/bin/env bash

set -e
set -o pipefail
set -x

YELLOW='\033[1;33m'
NC='\033[0m' # No Color

docker-compose up -d marketing

set +x
echo -e "${YELLOW}edX Marketing Site is not fully provisioned yet.${NC}"
echo -e "${YELLOW}For full setup, see:${NC}"
echo -e "${YELLOW}    https://openedx.atlassian.net/wiki/spaces/ENG/pages/159162183/Marketing+Site${NC}"
set -x
