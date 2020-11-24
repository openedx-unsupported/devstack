Open edX Devstack |Build Status|
================================

Get up and running quickly with Open edX services.

This project replaces the older Vagrant-based devstack with a
multi-container approach driven by `Docker Compose`_.

A Devstack installation includes the following Open edX components by default:

* The Learning Management System (LMS)
* Open Response Assessments (ORA2), among other LMS plug-ins.
* Open edX Studio
* Discussion Forums
* E-Commerce
* Credentials
* Notes
* Course Discovery
* Open edX Search
* A demonstration Open edX course
* The Publisher and Gradebook micro-frontends

It also includes the following extra components:

* XQueue
* The Learning micro-frontend (A.K.A the new Courseware experience)
* The Program Console micro-frontend
* The Library Authoring micro-frontend
* edX Registrar service.
* The course-authoring micro-frontend

.. Because GitHub doesn't support `toctree`, the Table of Contents is hand-written.
.. Please keep it up-to-date with all the top-level headings.
.. Regenerate: grep '^----' README.rst -B 1 | grep -v -e '--' | sed 's/\(.*\)/* `\1`_/' | tail -n+2

Table of Contents
-----------------

* `Where to Find Help`_
* `Prerequisites`_
* `Using the Latest Images`_
* `Roadmap`_
* `Getting Started`_
* `Usernames and Passwords`_
* `Service List`_
* `Useful Commands`_
* `Frequently Asked Questions`_
* `Testing and Debugging`_
* `Troubleshooting: General Tips`_
* `Troubleshooting: Common Issues`_
* `Troubleshooting: Performance`_
* `Known Issues`_
* `Advanced Configuration Options`_

Where to Find Help
------------------

There are a number of places to get help, including mailing lists and real-time chat. Please choose an appropriate venue for your question. This helps ensure that you get good prompt advice, and keeps discussion focused. For details of your options, see the `Community`_ pages.

Prerequisites
-------------

You will need to have the following installed:

- make
- Python 3
- Docker

This project requires **Docker 17.06+ CE**.  We recommend Docker Stable, but
Docker Edge should work as well.

**NOTE:** Switching between Docker Stable and Docker Edge will remove all images and
settings.  Don't forget to restore your memory setting and be prepared to
provision.

For macOS users, please use `Docker for Mac`_. Previous Mac-based tools (e.g.
boot2docker) are *not* supported.

Since a Docker-based devstack runs many containers,
you should configure Docker with a sufficient
amount of resources. We find that `configuring Docker for Mac`_ with
a minimum of 2 CPUs, 8GB of memory, and a disk image size of 96GB does work.

`Docker for Windows`_ may work but has not been tested and is *not* supported.

If you are using Linux, use the ``overlay2`` storage driver, kernel version
4.0+ and *not* ``overlay``. To check which storage driver your
``docker-daemon`` uses, run the following command.

.. code:: sh

   docker info | grep -i 'storage driver'

Please note
~~~~~~~~~~~

You should run all ``make`` commands described below on your local machinge, *not*
from within a Virtual Machine, as these commands are meant to stand up a VM-like environment using
Docker containers.

However, you may want to run the ``make`` commands from within a Python 3 virtual
environment, as described in `Getting Started`_. This will keep the Python packages required for Devstack separate from
the ones installed globally on your system.

Using the Latest Images
-----------------------

**NOTE:** LMS is now using MySql 5.7 by default, you have to run  ``make dev.pull.lms``  and  ``make dev.provision.lms``  (more details in `Getting Started`_)
to fetch latest images and re provision local copies of databases in order for an existing devstack setup to keep working.

By default, these instructions will install the master branch. If you want to install a named release instead (e.g. juniper.master), follow the steps in `How do I run the images for a named Open edX release?`_ before pulling the docker images. You can learn more about named releases in the `official documentation <https://edx.readthedocs.io/projects/edx-developer-docs/en/latest/named_releases.html>`_.

New images for our services are published frequently.  Assuming that you've followed the steps in `Getting Started`_
below, run the following sequence of commands if you want to use the most up-to-date versions of *all* default devstack images.

.. code:: sh

    make down
    make dev.pull
    make dev.up

This will stop and remove any running devstack containers, pull the latest images, and then start all of the devstack containers.

If you wish to pull only images relevant to certain services, you can run ``make dev.pull.<services>``.
For example, the following only only pulls images of E-Commerce and Credentials, as well as their dependencies (like LMS).

.. code:: sh

    make dev.pull.ecommerce+credentials

To further save time, ``make dev.pull.without-deps.<services>`` pulls the images for the specified service and *nothing else*.

.. code:: sh

    make dev.pull.without-deps.ecommerce+credentials

Roadmap
-------

This repository is in sustained status. The goal is to deprecate this codebase and move the development environment setup into the repos with the application code.

Documentation for future of devstack can be found at: `decentralized devstack`_

Documentation for first prototype of decentralized devstack can be found at: `decentralized devstack workflows`_

.. _decentralized devstack: https://github.com/edx/open-edx-proposals/blob/master/oeps/oep-0005/decisions/0002-why-decentralized-devstack.rst
.. _decentralized devstack workflows: https://github.com/edx/enterprise-catalog/blob/master/docs/decentralized_devstack_workflows.rst


Getting Started
---------------

The default devstack services can be run by following the steps below.

1. Install the requirements inside of a `Python virtualenv`_.

   .. code:: sh

       make requirements

   This will install docker-compose and other utilities into your virtualenv.

2. The Docker Compose file mounts a host volume for each service's executing
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

   .. _step 3:
3. Pull any changes made to the various images on which the devstack depends.

   .. code:: sh

       make dev.pull

3. Optional: You have an option to use NFS on MacOS which may improve the performance significantly. To set it up ONLY ON MAC, do
    .. code:: sh

        make dev.nfs.setup


4. Run the provision command, if you haven't already, to configure the various
   services with superusers (for development without the auth service) and
   tenants (for multi-tenancy).

   **NOTE:** When running the provision command, databases for ecommerce and edxapp
   will be dropped and recreated.

   The username and password for the superusers are both ``edx``. You can access
   the services directly via Django admin at the ``/admin/`` path, or login via
   single sign-on at ``/login/``.

   Default:

   .. code:: sh

       make dev.provision

   Provision using `docker-sync`_:

   .. code:: sh

       make dev.sync.provision

   Provision using NFS:

   .. code:: sh

       make dev.nfs.provision

   This is expected to take a while, produce a lot of output from a bunch of steps, and finally end with ``Provisioning complete!``

   **NOTE:** This command will bring up both MySQL 5.6 and 5.7 databases until all services are upgraded to 5.7.

5. Start the services. This command will mount the repositories under the
   ``DEVSTACK_WORKSPACE`` directory.

   **NOTE:** it may take up to 60 seconds for the LMS to start, even after the ``make dev.up`` command outputs ``done``.

   Default:

   .. code:: sh

       make dev.up

   Start using `docker-sync`_:

   .. code:: sh

       make dev.sync.up

   Start using NFS:

   .. code:: sh

       make dev.nfs.up


To stop a service, use ``make dev.stop.<service>``, and to both stop it
and remove the container (along with any changes you have made
to the filesystem in the container) use ``make dev.down.<service>``.

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


Usernames and Passwords
-----------------------

The provisioning script creates a Django superuser for every service.

::

    Email: edx@example.com
    Username: edx
    Password: edx

The LMS also includes demo accounts. The passwords for each of these accounts
is ``edx``.

  .. list-table::
   :widths: 20 60
   :header-rows: 1

   * - Account
     - Description
   * - ``staff@example.com``
     - An LMS and Studio user with course creation and editing permissions.
       This user is a course team member with the Admin role, which gives
       rights to work with the demonstration course in Studio, the LMS, and
       Insights.
   * - ``verified@example.com``
     - A student account that you can use to access the LMS for testing
       verified certificates.
   * - ``audit@example.com``
     - A student account that you can use to access the LMS for testing course
       auditing.
   * - ``honor@example.com``
     - A student account that you can use to access the LMS for testing honor
       code certificates.

Service List
------------

These are the edX services that Devstack can provision, pull, run, attach to, etc.
Each service is accessible at ``localhost`` on a specific port.
The table below provides links to the homepage, API root, or API docs of each service,
as well as links to the repository where each service's code lives.

The services marked as ``Default`` are provisioned/pulled/run whenever you run
``make dev.provision`` / ``make dev.pull`` / ``make dev.up``, respectively.

The extra services are provisioned/pulled/run when specifically requested (e.g.,
``make dev.provision.xqueue`` / ``make dev.pull.xqueue`` / ``make dev.up.xqueue``).
Alternatively, you can run these by modifying the ``DEFAULT_SERVICES`` option as described in the `Advanced Configuration Options`_ section.

+------------------------------------+-------------------------------------+----------------+--------------+
| Service                            | URL                                 | Type           | Role         |
+====================================+=====================================+================+==============+
| `lms`_                             | http://localhost:18000/             | Python/Django  | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `studio`_                          | http://localhost:18010/             | Python/Django  | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `forum`_                           | http://localhost:44567/api/v1/      | Ruby/Sinatra   | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `discovery`_                       | http://localhost:18381/api-docs/    | Python/Django  | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `ecommerce`_                       | http://localhost:18130/dashboard/   | Python/Django  | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `credentials`_                     | http://localhost:18150/api/v2/      | Python/Django  | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `edx_notes_api`_                   | http://localhost:18120/api/v1/      | Python/Django  | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-publisher`_          | http://localhost:18400/             | MFE (React.js) | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `gradebook`_                       | http://localhost:1994/              | MFE (React.js) | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `registrar`_                       | http://localhost:18734/api-docs/    | Python/Django  | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `program-console`_                 | http://localhost:1976/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-learning`_           | http://localhost:2000/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-library-authoring`_  | http://localhost:3001/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `course-authoring`_                | http://localhost:2001/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `xqueue`_                          | http://localhost:18040/api/v1/      | Python/Django  | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+

.. _credentials: https://github.com/edx/credentials
.. _discovery: https://github.com/edx/course-discovery
.. _ecommerce: https://github.com/edx/ecommerce
.. _edx_notes_api: https://github.com/edx/edx-notes-api
.. _forum: https://github.com/edx/cs_comments_service
.. _frontend-app-publisher: https://github.com/edx/frontend-app-publisher
.. _gradebook: https://github.com/edx/frontend-app-gradebook
.. _lms: https://github.com/edx/edx-platform
.. _program-console: https://github.com/edx/frontend-app-program-console
.. _registrar: https://github.com/edx/registrar
.. _studio: https://github.com/edx/edx-platform
.. _lms: https://github.com/edx/edx-platform
.. _frontend-app-learning: https://github.com/edx/frontend-app-learning
.. _frontend-app-library-authoring: https://github.com/edx/frontend-app-library-authoring
.. _course-authoring: https://github.com/edx/frontend-app-course-authoring
.. _xqueue: https://github.com/edx/xqueue

Useful Commands
---------------

Abbreviated versions of commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You may notice that many Devstack commands come in the form ``dev.ACTION.SERVICE``.
As examples:

.. code:: sh

    make dev.up.registrar
    make dev.shell.lms
    make dev.attach.studio
    make dev.down.credentials
    make dev.migrate.edx_notes_api
    make dev.static.ecommerce
    make dev.restart-devserver.forum
    make dev.logs.gradebook

In general, these commands can also be given in the form ``SERVICE-ACTION``,
which saves some keystrokes and is often more friendly for automatic command-completion
by hitting TAB. As examples:

.. code:: sh

    make registrar-up
    make lms-shell
    make studio-attach
    make credentials-down
    make edx_notes_api-migrate
    make ecommerce-static
    make forum-restart-devserver
    make gradebook-logs

Bringing up fewer services
~~~~~~~~~~~~~~~~~~~~~~~~~~

``make dev.up`` can take a long time, as it starts all services, whether or not
you need them. To instead only start a single service and its dependencies, run
``make dev.up.<services>``. For example:

.. code:: sh

    make dev.up.lms

That above command will bring up LMS (along with Memcached, MySQL, DevPI, et al), but it will not bring up
Credentials, Studio, or E-Commerce or any of the other default services.

You can also specify multiple services:

.. code:: sh

    make dev.up.ecommerce+studio

Pulling fewer images
~~~~~~~~~~~~~~~~~~~~

Similarly, ``make dev.pull`` can take a long time, as it pulls all services' images,
whether or not you need them.
To instead only pull images required by your service and its dependencies,
run ``make dev.pull.<services>``. For example:

.. code:: sh

    make dev.pull.discovery

Restarting servers and containers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sometimes you may need to manually restart a particular application server To do so,
the quickest command to run is ``make dev.restart-devserver.<service>``, which restarts the Django/Sinatra server inside the container without restarting the container itself. For example:

.. code:: sh

    make dev.restart-devserver.credentials

This can be helpful, for example, if automatic code reloading isn't working for some reason.

If you wish to restart the *container itself*, which takes a bit longer but may resolve a larger class of issues, use ``make dev.restart-container.<services>``. For example:

.. code:: sh

    make dev.restart-container.credentials


Known Issues
------------

Currently, some containers rely on Elasticsearch 7 and some rely on Elasticsearch 1.5. This is
because services are in the process of being upgraded to Elasticsearch 7, but not all of them
support Elasticsearch 7 yet. As we complete these migrations, we will update the dependencies
of these containers.



Advanced Configuration Options
------------------------------

The file ``options.mk`` sets several configuration options to default values.
For example ``DEVSTACK_WORKSPACE`` (the folder where your Git repos are expected to be)
is set to this directory's parent directory by default,
and ``DEFAULT_SERVICES`` (the list of services that are provisioned and run by default)
is set to a fairly long list of services out of the box.
For more detail, refer to the comments in the file itself.

If you're feeling brave, you can create an git-ignored overrides file called
``options.local.mk`` in the same directory and set your own values. In general,
it's good to bring down containers before changing any settings.

Changing the Docker Compose Project Name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``COMPOSE_PROJECT_NAME`` variable is used to define Docker namespaced volumes
and network based on this value, so changing it will give you a separate set of databases.
This is handled for you automatically by setting the ``OPENEDX_RELEASE`` environment variable in ``options.mk``
(e.g. ``COMPOSE_PROJECT_NAME=devstack-juniper.master``. Should you want to manually override this, edit the ``options.local.mk`` in the root of this repo and create the file if it does not exist. Change the devstack project name by adding the following line:
   ``COMPOSE_PROJECT_NAME=<your-alternate-devstack-name>`` (e.g. ``COMPOSE_PROJECT_NAME=secondarydevstack``)

As a specific example, if ``OPENEDX_RELEASE`` is set in your environment as ``juniper.master``, then ``COMPOSE_PROJECT_NAME`` will default to ``devstack-juniper.master`` instead of ``devstack``.


.. _Docker Compose: https://docs.docker.com/compose/
.. _Docker for Mac: https://docs.docker.com/docker-for-mac/
.. _Docker for Windows: https://docs.docker.com/docker-for-windows/
.. _Docker Sync: https://github.com/EugenMayer/docker-sync/wiki
.. _Docker Sync installation instructions: https://github.com/EugenMayer/docker-sync/wiki/1.-Installation
.. _cached consistency mode for volume mounts: https://docs.docker.com/docker-for-mac/osxfs-caching/
.. _current status of implementing delegated consistency mode: https://github.com/docker/for-mac/issues/1592
.. _configuring Docker for Mac: https://docs.docker.com/docker-for-mac/#/advanced
.. _feature added in Docker 17.05: https://github.com/edx/configuration/pull/3864
.. _edx-e2e-tests README: https://github.com/edx/edx-e2e-tests/#how-to-run-lms-and-studio-tests
.. _edxops Docker image: https://hub.docker.com/r/edxops/
.. _Docker Hub: https://hub.docker.com/
.. _Pycharm Integration documentation: docs/pycharm_integration.rst
.. _devpi documentation: docs/devpi.rst
.. _edx-platform testing documentation: https://github.com/edx/edx-platform/blob/master/docs/guides/testing/testing.rst#running-python-unit-tests
.. _docker-sync: #improve-mac-osx-performance-with-docker-sync
.. |Build Status| image:: https://travis-ci.org/edx/devstack.svg?branch=master
    :target: https://travis-ci.org/edx/devstack
    :alt: Travis
.. _How do I build images?: docs/building-images.rst
.. _Django Migration Don'ts: https://engineering.edx.org/django-migration-donts-f4588fd11b64
.. _Python virtualenv: http://docs.python-guide.org/en/latest/dev/virtualenvs/#lower-level-virtualenv
.. _Community: https://open.edx.org/community/connect/
.. _updating relational database dumps: docs/database-dumps.rst
.. _building images for devstack: docs/building-images.rst
.. _Understanding Git Conceptually: https://www.sbf5.com/~cduan/technical/git/
.. _Changing Themes for an Open edX Site: https://edx.readthedocs.io/projects/edx-installing-configuring-and-running/en/latest/configuration/changing_appearance/theming/index.html
