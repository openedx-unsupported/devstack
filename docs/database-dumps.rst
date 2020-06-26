Updating Relational Database Dumps
==================================

We use relational database dumps to spend less time running relational database
migrations and to speed up the provisioning of a devstack. These dumps are saved
as .sql scripts in the root directory of this git repository and they should be
updated occasionally - when relational database migrations take a prolonged amount
of time *or* we want to incorporate database schema changes which were done manually.

To update the relational database dumps:

1. Backup the data of your existing devstack if needed.

2. If you are unsure whether the django_migrations tables (which keeps which migrations
were already applied) in each database are consistent with the existing database dumps,
disable the loading of these database dumps during provisioning by commenting out
the calls to ``load-db.sh`` in the provision-*.sh scripts. This ensures a start with a
completely fresh database and incorporates any changes that may have required some form
of manual intervention for existing installations (e.g. drop/move tables).

3. Run the shell script which destroys any existing devstack, creates a new one
and updates the relational database dumps:

.. code:: sh

   ./update-dbs-init-sql-scripts.sh
