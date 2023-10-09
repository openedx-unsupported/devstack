#!/usr/bin/env bash

# Load the specified database from a file of the same name.
#
# Example:
#   $ load-db edxapp
#
# This will load the edxapp database from a file named exapp.sql.

set -eu -o pipefail

if [ -z "$1" ]
then
    echo "You must supply a database name!"
    exit 1
fi

echo "Loading the $1 database..."
mysql_container=$(make --silent --no-print-directory dev.print-container.mysql80)
docker exec -i "$mysql_container" mysql -uroot $1 < $1.sql
echo "Finished loading the $1 database!"
