Getting Started
---------------

Prerequisites
~~~~~~~~~~~~~

You will need to have the following installed:

- make
- Python 3.8
- Docker, including ``docker compose``

This project requires **Docker 19.03+ CE**.  We recommend Docker Stable, but
Docker Edge should work as well. Ensure that your Docker installation includes
``docker compose``; on some operating systems (e.g. Ubuntu Linux) this may require
a separate package.

**NOTE:** Switching between Docker Stable and Docker Edge will remove all images and
settings.  Don't forget to restore your memory setting and be prepared to
provision.

For macOS users, please use `Docker for Mac`_, which comes with ``docker
compose``. Previous Mac-based tools (e.g. boot2docker) are *not* supported.
Please be aware that the `licensing terms`_ for Docker for Mac (aka Docker
Desktop) may mean that it is no longer free for your organization's use.

Since a Docker-based devstack runs many containers,
you should configure Docker with a sufficient
amount of resources. We find that `configuring Docker for Mac`_
with a minimum of **2 CPUs, 8GB of memory, and a disk image size of 96GB**
does work.

`Docker for Windows`_ may work but has not been tested and is *not* supported.

If you are using Linux, developers on Ubuntu (and Debian) should ensure
they've uninstalled docker.io and docker-compose from the main Ubuntu
repositories and instead install docker-ce and docker-compose-plugin from the
official Docker package repository:
https://docs.docker.com/engine/install/ubuntu/. Also they should use the
``overlay2`` storage driver, kernel version 4.0+ and *not* ``overlay``. To
check which storage driver your ``docker-daemon`` uses, run the following
command.

.. code:: sh

   docker info | grep -i 'storage driver'

.. _Docker for Mac: https://docs.docker.com/desktop/install/mac-install/
.. _licensing terms: https://www.docker.com/pricing/faq
.. _configuring Docker for Mac: https://docs.docker.com/desktop/settings/mac/#advanced
.. _Docker for Windows: https://docs.docker.com/desktop/install/windows-install/

Please note
~~~~~~~~~~~

You should run all ``make`` commands described below on your local machinge, *not*
from within a Virtual Machine, as these commands are meant to stand up a VM-like environment using
Docker containers.

Directions to setup devstack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The default devstack services can be run by following the steps below.

**Note:** This will set up a large number of services, more than you are likely to need to work with, but that's only necessary for first-time provisioning. See :doc:`service_list` and the :doc:`most common development workflow <workflow>` for how to run and update devstack with just the services you need, rather than the ``large-and-slow`` default set.

#. The Docker Compose file mounts a host volume for each service's executing
   code. The host directory defaults to be a sibling of this directory. For
   example, if this repo is cloned to ``~/workspace/devstack``, host volumes
   will be expected in ``~/workspace/course-discovery``,
   ``~/workspace/ecommerce``, etc. These repos can be cloned with the command
   below.

   .. code:: sh

       make dev.clone  # or, `make dev.clone.https` if you don't have SSH keys set up.

   You may customize where the local repositories are found by setting the
   ``DEVSTACK_WORKSPACE`` environment variable.

   (macOS only) Share the cloned service directories in Docker, using
   **Docker -> Preferences -> File Sharing** in the Docker menu.

#. Pull any changes made to the various images on which the devstack depends.

   .. code:: sh

       make dev.pull.large-and-slow

   Note -
   If you are setting up devstack to develop on Open edx named releases, see this `document on developing on named releases`_ before following this step 3.

   .. _document on developing on named releases: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/developing_on_named_release_branches.html

#. Run the provision command, if you haven't already, to configure the various
   services with superusers (for development without the auth service) and
   tenants (for multi-tenancy).

   **NOTE:** When running the provision command, databases for ecommerce and edxapp
   will be dropped and recreated.

   The username for the superuser is ``edx@example.com`` and the password is ``edx``. You can access
   the services directly via Django admin at the ``/admin/`` path, or login via
   single sign-on at ``/login/``.

   Default:

   .. code:: sh

       make dev.provision

   This is expected to take a while, produce a lot of output from a bunch of steps, and finally end with ``Provisioning complete!``


#. Start the desired services. This command will mount the repositories under the
   ``DEVSTACK_WORKSPACE`` directory.

   **NOTE:** it may take up to 60 seconds for the LMS to start, even after the ``dev.up.*`` command outputs ``done``.

   Default:

   .. code:: sh

       make dev.up.large-and-slow

To stop a service, use ``make dev.stop.<service>``, and to both stop it
and remove the container (along with any changes you have made
to the filesystem in the container) use ``make dev.remove-containers.<service>``.

After the services have started, if you need shell access to one of the
services, run ``make dev.shell.<service>``. For example to access the
Catalog/Course Discovery Service, you can run:

.. code:: sh

    make dev.shell.discovery

To see logs from containers running in detached mode, you can either use
"Kitematic" (available from the "Docker for Mac" menu), or by running the
following:

.. code:: sh

    make dev.logs

To view the logs of a specific service container run ``make dev.logs.<service>``.
For example, to access the logs for Ecommerce, you can run:

.. code:: sh

    make dev.logs.ecommerce

For information on the supported ``make`` commands, you can run:

.. code:: sh

    make help

Devstack collects some basic usage metrics to help gain a better understanding of how devstack is used and to surface any potential issues on local devstack environments. To learn more, read `0003-usage-metrics.rst ADR <./docs/decisions/0003-usage-metrics.rst>`_.

This data collection is behind a consent flag, so please help devstack's maintainers by enabling metrics collection by running the following:

.. code:: sh

   make metrics-opt-in

Now that you're up and running, read about the :doc:`most common development workflow <workflow>`.
