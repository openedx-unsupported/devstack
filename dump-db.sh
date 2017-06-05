#!/usr/bin/env bash

# Dump the specified database to a file of the same name.
#
# Example:
#   $ dump-db edxapp
#
# This will dump the edxapp database to a file named exapp.sql.

if [ -z "$1" ]
then
    echo "You must supply a database name!"
    exit 1
fi

echo "Dumping the $1 database..."
docker exec -i edx.devstack.mysql mysqldump --add-drop-database --skip-add-drop-table -B $1 > $1.sql
echo "Finished dumping the $1 database!"
