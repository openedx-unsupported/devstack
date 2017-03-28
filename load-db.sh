#!/usr/bin/env bash

# Load the specified database from a file of the same name.
#
# Example:
#   $ load-db edxapp
#
# This will load the edxapp database from a file named exapp.sql.

set -e
set -o pipefail

if [ -z "$1" ]
then
    echo "You must supply a database name!"
    exit 1
fi

echo "Loading the $1 database..."
docker exec -i edx.devstack.mysql mysql -uroot $1 < $1.sql
echo "Finished loading the $1 database!"
