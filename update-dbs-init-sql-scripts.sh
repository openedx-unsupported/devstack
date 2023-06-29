#!/usr/bin/env bash
# Updates MySQL databases dumps with MySQL Docker container schema/data
# Make sure you have added your user to the docker group before running this script
# or use sudo to run it

set -eu -o pipefail
set -x

# create a docker devstack with LMS and ecommerce
make destroy
make dev.clone.ssh
make dev.provision.services.lms+ecommerce


function dump_sql {
    DB_NAME="$1"
    MYSQL_DB_USER="$2"

    DUMP_NAME="$DB_NAME.sql"

    # It's important to use -T here to prevent pseudo-TTY allocation;
    # that would force mysql's stderr output (a complaint about
    # passwords on the command line) to be muxed into the dump output.
    docker-compose exec -T mysql57 mysqldump -u "$MYSQL_DB_USER" -p"password" \
                   --no-tablespaces --add-drop-database --skip-add-drop-table \
                   --databases "$DB_NAME" > "$DUMP_NAME"
}

# Dump MySQL schema and data to DB_NAME.sql (given DB name and user)
dump_sql edxapp edxapp001
dump_sql edxapp_csmh edxapp001
dump_sql ecommerce ecomm001


function dump_mongo {
    DB_NAME="$1"

    docker-compose exec -T mongo mongodump -u edxapp -p password --db "$DB_NAME" \
                   --archive > ./"mongo.$DB_NAME.archive"
}

# Dump Mongo data to mongo.DB_NAME.archive
dump_mongo edxapp
