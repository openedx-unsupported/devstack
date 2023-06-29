#!/usr/bin/env bash
# Load the specified Mongo database from file.
#
# Example:
#   $ load-db-mongo edxapp
#
# This will load the edxapp database from a file named ./mongo.exapp.archive

set -eu -o pipefail

if [ "$#" -ne 1 ]
then
    echo >&2 "You must supply a database name!"
    exit 1
fi

DB_NAME="$1"

echo >&2 "Loading the $DB_NAME database..."
docker-compose exec -T mongo mongorestore -u edxapp -p password --db "$DB_NAME" \
               --archive < "mongo.$DB_NAME.archive"
echo >&2 "Finished loading the $DB_NAME database!"
