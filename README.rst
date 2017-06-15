edX Devstack |Build Status|
===========================

Get up and running quickly with edX services.

If you are seeking info on the Vagrant-based devstack, please see
https://openedx.atlassian.net/wiki/display/OpenOPS/Running+Devstack. This
project is meant to replace the traditional Vagrant-based devstack with a
multi-container approach driven by `Docker Compose`_. It is still in the
alpha/beta testing phase. Support for this project is limited at the moment, so
it may take a while to respond to issues.

You should run any Make targets described below on your local machine, *not*
from within a VM.

Prerequisites
-------------

This project requires **Docker 17.05+ CE**. Currently, 17.05 is only available
through the **Edge** version Docker 17.05 CE Edge.

**Note:** Switching from Docker Stable to Docker Edge wil remove all images and
settings.  Don't forget to restore your memory setting and be prepared to
provision.

For macOS users, please use `Docker for Mac`_. Previous Mac-based tools (e.g.
boot2docker) are not supported.

`Docker for Windows`_ may work but has not been tested and is *not supported*.

Docker Sync
~~~~~~~~~~~

Docker for Mac has known filesystem issues that significantly decrease
performance, paticularly for starting edx-platform (e.g. when you want to run a
test). In order to mitigate these issues, we use `Docker Sync`_ to synchronize
file data from the host machine to the containers.

If you are using macOS, please follow the `Docker Sync installation
instructions`_ before provisioning.

The performance improvements provided by `cached consistency mode for volume
mounts`_ introduced in Docker CE Edge 17.04 are still not good enough. It's
possible that the "delegated" consistency mode will be enough to no longer need
docker-sync, but this feature doesn't appear to have been fully implemented yet
(as of Docker 17.06.0-ce-rc2, "delegated" behaves the same as "cached").


Getting Started
---------------

All of the services can be run by following the steps below. Note that since we
are running many containers, you should configure Docker with a sufficient
amount of resources. Our testing found that `configuring Docker for Mac`_ with
a minimum of 2 CPUs and 4GB of memory works well.

1. The Docker Compose file mounts a host volume for each service's executing
   code. The host directory is defaults to be a sibling of this directory. For
   example, if this repo is cloned to ``~/workspace/devstack``, host volumes
   will be expected in ``~/workspace/course-discovery``,
   ``~/workspace/ecommerce``, etc. These repos can be cloned with the command
   below.

   .. code:: sh

       make dev.clone

   You may customize where the local repositories are found by setting the
   DEVSTACK\_WORKSPACE environment variable.

2. Run the provision command, if you haven't already, to configure the various
   services with superusers (for development without the auth service) and
   tenants (for multi-tenancy).

   **Note** When running the provision command databases for ecommerce and edxapp
   will be dropped and recreated.

   The username and password for the superusers are both "edx". You can access
   the services directly via Django admin at the ``/admin/`` path, or login via
   single sign-on at ``/login/``.

   Provision using docker-sync (recommended for macOS users)

   .. code:: sh

       make dev.sync.provision

   Default (non-macOS users)

   .. code:: sh

       make dev.provision


3. Start the services. This command will mount the repositories under the
   DEVSTACK\_WORKSPACE directory.

   *Note: it may take up to 60 seconds for the LMS to start*

   Start using docker-sync (recommended for macOS users)

   .. code:: sh

       make dev.sync.up

   Default (non-macOS users)

   .. code:: sh

       make dev.up

After the services have started, if you need shell access to one of the
services, run ``make <service>-shell``. For example to access the
Catalog/Course Discovery Service, you can run:

.. code:: sh

    make discovery-shell

To see logs from containers running in detached mode, you can either use
"Kitematic" (available from the "Docker for Mac" menu), or by running the
following:

.. code:: sh

    make logs

To view the logs of a specific service container run ``make <service>-logs``.
For example to access the logs for Ecommerce, you can run:

.. code:: sh

    make ecommerce-logs

To reset your environment and start provisioning from scratch, you can run:

.. code:: sh

    make destroy

Usernames and Passwords
-----------------------

The provisioning script creates a Django superuser for every service.

::

    Email: edx@example.com
    Username: edx
    Password: edx

The LMS also includes demo accounts. The passwords for each of these accounts
is ``edx``.

+------------+------------------------+
| Username   | Email                  |
+============+========================+
| audit      | audit@example.com      |
+------------+------------------------+
| honor      | honor@example.com      |
+------------+------------------------+
| staff      | staff@example.com      |
+------------+------------------------+
| verified   | verified@example.com   |
+------------+------------------------+

Service URLs
------------

Each service is accessible at ``localhost`` on a specific port. The table below
provides links to the homepage of each service. Since some services are not
meant to be user-facing, the "homepage" may be the API root.

+---------------------+-------------------------------------+
| Service             | URL                                 |
+=====================+=====================================+
| Credentials         | http://localhost:18150/api/v2/      |
+---------------------+-------------------------------------+
| Catalog/Discovery   | http://localhost:18381/api-docs/    |
+---------------------+-------------------------------------+
| E-Commerce/Otto     | http://localhost:18130/dashboard/   |
+---------------------+-------------------------------------+
| LMS                 | http://localhost:18000/             |
+---------------------+-------------------------------------+
| Studio/CMS          | http://localhost:18010/             |
+---------------------+-------------------------------------+

Useful Commands
---------------

Sometimes you may need to restart a particular application server. To do so,
simply use the ``docker-compose restart`` command:

.. code:: sh

    docker-compose restart <service>

``<service>`` should be replaced with one of the following:

-  credentials
-  discovery
-  ecommerce
-  lms
-  studio

Marketing Site
--------------

Docker Compose files useful for integrating with the edx.org marketing site are
available. This will NOT be useful to those outside of edX. For details on
getting things up and running, see
https://openedx.atlassian.net/wiki/display/OpenDev/Marketing+Site.

How do I build images?
----------------------

**Note:** Building images requires a `feature added in Docker 17.05`_.

We are still working on automated image builds, but generally try to push new
images every 3-7 days. If you want to build the images on your own, the
Dockerfiles are available in the ``edx/configuration`` repo.

NOTES

1. discovery and edxapp use the ``latest`` tag since their configuration changes have been merged to master branch of
   ``edx/configuration``.
2. We are experimenting with hosting a ``Dockerfile`` in the ``edx/credentials`` repository, hence the ``devstack-slim``
   tag. See that repo for more information on building its image.
3. All other services use the ``devstack`` tag and are build from the ``clintonb/docker-devstack-idas`` branch of
   ``edx/configuration``.


.. code:: sh

    git checkout master
    git pull
    docker build -f docker/build/edxapp/Dockerfile . -t edxops/edxapp:latest

.. code:: sh

    git checkout clintonb/docker-devstack-idas
    git pull
    docker build -f docker/build/ecommerce/Dockerfile . -t edxops/ecommerce:devstack

The build commands above will use your local configuration, but pull
application code from the master branch of the application's repository. If you
would like to use code from another branch/tag/hash, modify the ``*_VERSION``
variable that lives in the ``ansible_overrides.yml`` file beside the
``Dockerfile``.

For example, if you wanted to build tag ``release-2017-03-03`` for the
E-Commerce Service, you would modify ``ECOMMERCE_VERSION`` in
``docker/build/ecommerce/ansible_overrides.yml``.

PyCharm Integration
-------------------

See the `Pycharm Integration documentation`_.

Troubleshooting: General Tips
-----------------------------

If you are having trouble with your containers there are a few general steps
you can take to try to resolve.

Check the logs
~~~~~~~~~~~~~~

If a container stops unexpectedly, you can look at its logs for clues::

    docker-compose logs lms

Update the code and images
~~~~~~~~~~~~~~~~~~~~~~~~~~

Make sure you have the latest code and Docker images.

Pull the latest Docker images by running the following command from the devstack
directory:

.. code:: sh

   make pull

Pull the latest Docker Compose configuration and provisioning scripts by running
the following command from the devstack directory:

.. code:: sh

   git pull

Lastly, the images are built from the master branches of the application
repositories (e.g. edx-platform, ecommerce, etc.). Make sure you are using the
latest code from the master branches, or have rebased your branches on master.

Clean the containers
~~~~~~~~~~~~~~~~~~~~

Sometimes containers end up in strange states and need to be rebuilt. Run
``make down`` to remove all containers and networks. This will NOT remove your
data volumes.

Start over
~~~~~~~~~~

If you want to completely start over, run ``make destroy``. This will remove
all containers, networks, AND data volumes.

Troubleshooting: Common issues
------------------------------

File ownership change
~~~~~~~~~~~~~~~~~~~~~

If you notice that the ownership of some (maybe all) files have changed and you
need to enter your root password when editing a file, that could be because you
have pulled changes the remote repository from within a container. While running
``git pull`` git changes the owner of the files that you pull to the user that runs
that command, and within a container that is the root user, hence git operations
should be ran outside of the container.
To fix this change the owner back to yourself outside of the container by running:

.. code:: sh

  $ sudo chown <user>:<group> -R .

Running LMS commands within a container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Most of the ``paver`` commands require a settings flag, which if omitted defaults to
``devstack`` which is the settings flag for vagrant-based devstack instances. Therefor
if you run into issues running those command in a docker container you should append
the ``devstack_docker`` flag. For example:

.. code:: sh

  $ paver update_assets --settings=devstack_docker

Resource busy or locked
~~~~~~~~~~~~~~~~~~~~~~~

While running ``make static`` within the ecommerce container you could get an error
saying:

  Error: Error: EBUSY: resource busy or locked, rmdir '/edx/app/ecommerce/ecommerce/ecommerce/static/build/'

To fix this, remove the directory manually outside of the container and run the command again.

No space left on device
~~~~~~~~~~~~~~~~~~~~~~~

If you see the error "no space left on device" on a Mac, it means Docker has run
out of space in its Docker.qcow2 file.

Here is an example error while running `make pull`:

.. code:: sh

   ...
   32d52c166025: Extracting [==================================================>] 1.598 GB/1.598 GB
   ERROR: failed to register layer: Error processing tar file(exit status 1): write /edx/app/edxapp/edx-platform/.git/objects/pack/pack-4ff9873be2ca8ab77d4b0b302249676a37b3cd4b.pack: no space left on device
   make: *** [pull] Error 1

You can clean up data by running `docker system prune`, but you will first want
to run `make dev.up` so it doesn't delete stopped containers.

Or, you can run the following commands to clean up dangling images and volumes:

.. code:: sh

   docker rmi $(docker images -f "dangling=true" -q)
   docker volume rm $(docker volume ls -qf dangling=true)

.. _Docker Compose: https://docs.docker.com/compose/
.. _Docker for Mac: https://docs.docker.com/docker-for-mac/
.. _Docker for Windows: https://docs.docker.com/docker-for-windows/
.. _Docker Sync: https://github.com/EugenMayer/docker-sync/wiki
.. _Docker Sync installation instructions: https://github.com/EugenMayer/docker-sync/wiki/1.-Installation
.. _cached consistency mode for volume mounts: https://docs.docker.com/docker-for-mac/osxfs-caching/
.. _configuring Docker for Mac: https://docs.docker.com/docker-for-mac/#/advanced
.. _feature added in Docker 17.05: https://github.com/edx/configuration/pull/3864
.. _Pycharm Integration documentation: docs/pycharm_integration.rst
.. |Build Status| image:: https://travis-ci.org/edx/devstack.svg?branch=master
   :target: https://travis-ci.org/edx/devstack
