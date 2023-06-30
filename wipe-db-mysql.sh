#!/usr/bin/env bash
# Delete the specified MySQL database.
#
# Example:
#   $ wipe-db-mysql edxapp

set -eu -o pipefail

if [ "$#" -ne 1 ]
then
    echo >&2 "You must supply a database name!"
    exit 1
fi

DB_NAME="$1"

echo >&2 "Deleting the $DB_NAME MySQL database..."

docker-compose exec -T mysql57 mysql -uroot <<EOSQL
DROP DATABASE IF EXISTS \`$DB_NAME\`;
CREATE DATABASE \`$DB_NAME\` DEFAULT CHARACTER SET utf8;
EOSQL

echo >&2 "Finished deleting the $DB_NAME MySQL database"
