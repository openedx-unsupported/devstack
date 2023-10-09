Manual upgrade instructions
###########################

Occasionally there is a change to devstack that requires existing devstack installations to be manually upgraded. When this happens, instructions should be added here.

Please add new instructions to the top, include a date, and make a post in the `Devstack forum <https://discuss.openedx.org/tags/c/development/11/devstack>`_.

(If you just need to update your devstack to the latest version of everything, see :doc:`updating_devstack`.)

2023-10-05 - MySQL upgrade from version 5.7 to 8.0
**************************************************

The MySQL service has been upgraded from version 5.7 to 8.0. Developers will need to follow the following instructions.

1. Stop the running containers ::

    make dev.stop

2. Take latest ``git pull`` of ``devstack`` and ``edx-platform``
3. Take the latest pull of images ::

    make dev.pull

4. Run provisioning command ::

    make dev.provision

5. [Optional] Additionally, there is a database copy command to help you transfer data from MySQL 5.7 to 8.0. After provisioning use the following command ::

    make dev.dbcopyall8

This command copies the following databases:

- credentials
- discovery
- ecommerce
- registrar
- notes
- edxapp
- xqueue
- edxapp_csmh
- dashboard
- analytics-api
- reports
- reports_v1

If you prefer not to copy all databases, update ``DB_NAMES_LIST`` in the ``Makefile`` of devstack before running the dbcopy command.

2023-08-02 - Forum upgrade from Ruby 2 to 3
*******************************************

The forum service has been upgraded from Ruby 2 to Ruby 3. Developers who use forum will need to pull the new image and reprovision the service::

    make dev.pull.forum  # pull in new forum image
    make dev.provision.forum  # provision forum service
