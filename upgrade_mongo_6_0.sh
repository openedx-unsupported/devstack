#!/usr/bin/env bash
set -eu -o pipefail

# This script will upgrade a devstack that was previosly running Mongo DB 5.x to MongoDB 6.x

. scripts/colors.sh

# Upgrade to mongo 6.0
export MONGO_VERSION=6.0.12

echo
echo -e "${GREEN}Restarting Mongo on version ${MONGO_VERSION}${NC}"
make dev.up.mongo
mongo_container="$(make --silent --no-print-directory dev.print-container.mongo)"

echo -e "${GREEN}Waiting for MongoDB...${NC}"
until docker exec "$mongo_container" mongosh --eval 'db.serverStatus()' &> /dev/null
do
    printf "."
    sleep 1
done

echo -e "${GREEN}MongoDB ready.${NC}"
MONGO_VERSION_LIVE=$(docker exec -it "$mongo_container" mongosh --quiet --eval "printjson(db.version())")
MONGO_VERSION_COMPAT=$(docker exec -it "$mongo_container" mongosh --quiet \
    --eval "printjson(db.adminCommand( { getParameter: 1, featureCompatibilityVersion: 1 } )['featureCompatibilityVersion'])")
echo -e "${GREEN}Mongo Server version: ${MONGO_VERSION_LIVE}${NC}"
echo -e "${GREEN}Mongo FeatureCompatibilityVersion version: ${MONGO_VERSION_COMPAT}${NC}"

echo -e "${GREEN}Upgrading FeatureCompatibilityVersion to 6.0${NC}"
docker exec -it "$mongo_container" mongosh --eval "db.adminCommand( { setFeatureCompatibilityVersion: \"6.0\" } )"
