#!/usr/bin/env bash
# Updates MySQL databases dumps with MySQL Docker container schema/data
# Make sure you have added your user to the docker group before running this script
# or use sudo to run it

set -eu -o pipefail
set -x

# constants
readonly EDXAPP_MYSQL_DB_USER="edxapp001"
readonly ECOMMERCE_MYSQL_DB_USER="ecomm001"
readonly MYSQL_DB_PASSWORD="password"
readonly EDXAPP_DBS=("edxapp" "edxapp_csmh")
DBS=("ecommerce" "${EDXAPP_DBS[@]}")

# don't include the demo course in the initial sql since it relies on data being present in mongo
export DEVSTACK_SKIP_DEMO="true"


# create a docker devstack with LMS and ecommerce
make destroy
make dev.clone.ssh
make dev.pull.lms+ecommerce
make dev.provision.services.lms+ecommerce

# dump schema and data from mysql databases in the mysql docker container and copy them to current directory in docker host
MYSQL_DOCKER_CONTAINER="$(make --silent --no-print-directory dev.print-container.mysql80)"
for DB_NAME in "${DBS[@]}"; do
    DB_CREATION_SQL_SCRIPT="${DB_NAME}.sql"
    if [[ " ${EDXAPP_DBS[@]} " =~ " ${DB_NAME} " ]]; then
        MYSQL_DB_USER=${EDXAPP_MYSQL_DB_USER}
    else
        MYSQL_DB_USER=${ECOMMERCE_MYSQL_DB_USER}
    fi
    docker exec ${MYSQL_DOCKER_CONTAINER} /bin/bash -c "mysqldump -u ${MYSQL_DB_USER} -p${MYSQL_DB_PASSWORD} --no-tablespaces --add-drop-database --skip-add-drop-table --databases ${DB_NAME} > ${DB_CREATION_SQL_SCRIPT}"
    docker cp ${MYSQL_DOCKER_CONTAINER}:/${DB_CREATION_SQL_SCRIPT} .
done
