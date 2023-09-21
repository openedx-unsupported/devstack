Manual upgrade instructions
###########################

Occasionally there is a change to devstack that requires existing devstack installations to be manually upgraded. When this happens, instructions should be added here.

Please add new instructions to the top, include a date, and make a post in the `Devstack forum <https://discuss.openedx.org/tags/c/development/11/devstack>`_.

(If you just need to update your devstack to the latest version of everything, see :doc:`updating_devstack`.)

2023-08-02 - Forum upgrade from Ruby 2 to 3
*******************************************

The forum service has been upgraded from Ruby 2 to Ruby 3. Developers who use forum will need to pull the new image and reprovision the service::

    make dev.pull.forum  # pull in new forum image
    make dev.provision.forum  # provision forum service
