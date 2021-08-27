#!/usr/bin/env bash
set -eu -o pipefail

# This script will upgrade a devstack that was previosly running Mongo DB 4.0 to MongoDB 4.0

. scripts/colors.sh

# Upgrade to mongo 4.2
export MONGO_VERSION=4.2.14

echo
echo -e "${GREEN}Restarting Mongo on version ${MONGO_VERSION}${NC}"
make dev.up.mongo
mongo_container="$(make --silent --no-print-directory dev.print-container.mongo)"

echo -e "${GREEN}Waiting for MongoDB...${NC}"
until docker exec "$mongo_container" mongo --eval 'db.serverStatus()' &> /dev/null
do
    printf "."
    sleep 1
done

echo -e "${GREEN}MongoDB ready.${NC}"
MONGO_VERSION_LIVE=$(docker exec -it "$mongo_container" mongo --quiet --eval "printjson(db.version())")
MONGO_VERSION_COMPAT=$(docker exec -it "$mongo_container" mongo --quiet \
    --eval "printjson(db.adminCommand( { getParameter: 1, featureCompatibilityVersion: 1 } )['featureCompatibilityVersion'])")
echo -e "${GREEN}Mongo Server version: ${MONGO_VERSION_LIVE}${NC}"
echo -e "${GREEN}Mongo FeatureCompatibilityVersion version: ${MONGO_VERSION_COMPAT}${NC}"

if echo "${MONGO_VERSION_COMPAT}" | grep -q "4\.0" ; then
    echo -e "${GREEN}Upgrading FeatureCompatibilityVersion to 4.2${NC}"
    docker exec -it "$mongo_container" mongo --eval "db.adminCommand( { setFeatureCompatibilityVersion: \"4.2\" } )"
else
    echo -e "${GREEN}FeatureCompatibilityVersion already set to 4.2${NC}"
fi
