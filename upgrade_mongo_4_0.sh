#!/usr/bin/env bash
set -eu -o pipefail

# This script will upgrade a devstack that was previosly running Mongo DB 3.2, 3.4 or 3.6 to MongoDB 4.0

. scripts/colors.sh

export MONGO_VERSION=3.4.24
current_mongo_version="3.4"
echo -e "${GREEN}Sarting Mongo ${MONGO_VERSION}${NC}"
make dev.up.mongo
mongo_container="$(make --silent --no-print-directory dev.print-container.mongo)"

echo -e "${GREEN}Waiting for MongoDB...${NC}"
until docker exec "$mongo_container" mongo --eval 'db.serverStatus()' &> /dev/null
do
    if docker logs "$mongo_container" | grep -q "BadValue: Invalid value for version, found 4.0, expected '3.4' or '3.2'"; then
        echo -e "${YELLOW}Already upgraded to Mongo 4.0, exiting${NC}"
        exit
    elif docker logs "$mongo_container" | grep -q "BadValue: Invalid value for version, found 3.6, expected '3.4' or '3.2'"; then
        current_mongo_version="3.6"
        break
    fi
    printf "."
    sleep 1
done

if [[ $current_mongo_version == "3.4" ]]; then
    echo -e "${GREEN}MongoDB ready.${NC}"
    MONGO_VERSION_LIVE=$(docker exec -it "$mongo_container" mongo --quiet --eval "printjson(db.version())")
    MONGO_VERSION_COMPAT=$(docker exec -it "$mongo_container" mongo --quiet \
        --eval "printjson(db.adminCommand( { getParameter: 1, featureCompatibilityVersion: 1 } )['featureCompatibilityVersion'])")
    echo -e "${GREEN}Mongo Server version: ${MONGO_VERSION_LIVE}${NC}"
    echo -e "${GREEN}Mongo FeatureCompatibilityVersion version: ${MONGO_VERSION_COMPAT}${NC}"

    if echo "${MONGO_VERSION_COMPAT}" | grep -q "3\.2" ; then
        echo -e "${GREEN}Upgrading FeatureCompatibilityVersion to 3.4${NC}"
        docker exec -it "$mongo_container" mongo --eval "db.adminCommand( { setFeatureCompatibilityVersion: \"3.4\" } )"
    else
        echo -e "${GREEN}FeatureCompatibilityVersion already set to 3.4${NC}"
    fi
fi


export MONGO_VERSION=3.6.17

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

if echo "${MONGO_VERSION_COMPAT}" | grep -q "3\.4" ; then
    echo -e "${GREEN}Upgrading FeatureCompatibilityVersion to 3.6${NC}"
    docker exec -it "$mongo_container" mongo --eval "db.adminCommand( { setFeatureCompatibilityVersion: \"3.6\" } )"
else
    echo -e "${GREEN}FeatureCompatibilityVersion already set to 3.6${NC}"
fi

# Upgrade to mongo 4
export MONGO_VERSION=4.0.22

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

if echo "${MONGO_VERSION_COMPAT}" | grep -q "3\.6" ; then
    echo -e "${GREEN}Upgrading FeatureCompatibilityVersion to 4.0${NC}"
    docker exec -it "$mongo_container" mongo --eval "db.adminCommand( { setFeatureCompatibilityVersion: \"4.0\" } )"
else
    echo -e "${GREEN}FeatureCompatibilityVersion already set to 4.0${NC}"
fi
