Open edX Devstack |Build Status provisioning| |Build Status CLI| |docs|
=======================================================================

Devstack is the local Docker-based environment for developing in the Open edX
platform.  Use it to get up and running quickly with Open edX services.

Documentation is on `Read the Docs`_.  Code repository is on `GitHub`_.

.. _Read the Docs: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/
.. _GitHub: https://github.com/edx/devstack

The Devstack runs as multiple containers with `Docker Compose`_ at its core.

A Devstack installation includes the following Open edX components by default:

* The Learning Management System (LMS)
* The Learning micro-frontend (A.K.A the new Courseware experience)
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
* The Program Console micro-frontend
* The Library Authoring micro-frontend
* edX Registrar service.
* The course-authoring micro-frontend


.. contents:: **Table of Contents:**

Where to Find Help
------------------

There are a number of places to get help, including mailing lists and real-time chat. Please choose an appropriate venue for your question. This helps ensure that you get good prompt advice, and keeps discussion focused. For details of your options, see the `Community`_ pages.

- See the `most common development workflow`_ (after you've finished `Getting Started`_).
- See the `Devstack Interface`_
- See some `helpful troubleshooting tips`_.
- See the `Frequently Asked Questions`_.
- Or learn about `testing and debugging your code in devstack`_.
- If you get confused about any of the terms used in these docs, see `edX Glossary`_

You can also browse all the documentation in `Read the Docs`_.

.. _most common development workflow: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/workflow.html
.. _Devstack Interface: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/devstack_interface.html
.. _helpful troubleshooting tips: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/troubleshoot_general_tips.html
.. _Frequently Asked Questions: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/devstack_faq.html
.. _testing and debugging your code in devstack:
.. _testing_and_debugging.rst: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/testing_and_debugging.html
.. _edX Glossary: https://openedx.atlassian.net/wiki/spaces/AC/pages/28967341/edX+Glossary

.. _Read the Docs: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/

Notices
-------

**NOTE:** LMS is now using MySql 5.7 by default. You have to run ``make dev.pull.lms`` and ``make dev.provision.lms`` (more details in `Getting Started`_) to fetch latest images and reprovision local copies of databases in order for an existing devstack setup to keep working.


Getting Started
---------------

Prerequisites
~~~~~~~~~~~~~

You will need to have the following installed:

- make
- Python 3.8
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
amount of resources. We find that `configuring Docker for Mac`_
with a minimum of **2 CPUs, 8GB of memory, and a disk image size of 96GB**
does work.

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

Directions to setup devstack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The default devstack services can be run by following the steps below.

**Note:** This will set up a large number of services, more than you are likely to need to work with, but that's only necessary for first-time provisioning. See `Service List`_ and the `most common development workflow`_ for how to run and update devstack with just the services you need, rather than the ``large-and-slow`` default set.

#. Install the requirements inside of a `Python virtualenv`_.

   .. code:: sh

       make requirements

   This will install docker-compose and other utilities into your virtualenv.

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

   The username and password for the superusers are both ``edx``. You can access
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

Devstack collects some basic usage metrics to help gain a better understanding of how devstack is used and to surface any potential issues on local devstack environments. To learn more, read `0003-usage-metrics.rst ADR <./docs/decisions/0003-usage-metrics.rst>`_.

This data collection is behind a consent flag, so please help devstack's maintainers by enabling metrics collection by running the following:

.. code:: sh

   make metrics-opt-in

Now that you're up and running, read about the `most common development workflow`_.

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

Most developers will be best served by working with specific combinations of these services, for example ``make dev.pull.studio`` or ``make dev.up.ecommerce``. These will pull in dependencies as needed—starting ecommerce will also start lms, and lms will pull in forums, discovery, and others. If you need multiple, they can be listed like ``make dev.up.studio+ecommerce``. After the service table below there is a list of some common combinations.

Instead of a service name or list, you can also run commands like ``make dev.provision`` / ``make dev.pull.large-and-slow`` / ``make dev.up.large-and-slow``. This is a larger list than most people will need for most of their work, and includes all of the services marked "Default" in the below table. (Some of these targets use ``large-and-slow`` in their name as a warning; others may be changed to use this over time.) However, you can change this list by modifying the ``DEFAULT_SERVICES`` option as described in the `Advanced Configuration Options`_ section.

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
| `frontend-app-learning`_           | http://localhost:2000/              | MFE (React.js) | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-payment`_            | http://localhost:1998/              | MFE (React.js) | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-publisher`_          | http://localhost:18400/             | MFE (React.js) | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-gradebook`_          | http://localhost:1994/              | MFE (React.js) | Default      |
+------------------------------------+-------------------------------------+----------------+--------------+
| `registrar`_                       | http://localhost:18734/api-docs/    | Python/Django  | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-program-console`_    | http://localhost:1976/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-library-authoring`_  | http://localhost:3001/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-course-authoring`_   | http://localhost:2001/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `frontend-app-account`_            | http://localhost:1997/              | MFE (React.js) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `xqueue`_                          | http://localhost:18040/api/v1/      | Python/Django  | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `coursegraph`                      | http://localhost:7474/browser       | Tooling (Java) | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+
| `insights`                         | http://localhost:18110              | Python/Django  | Extra        |
+------------------------------------+-------------------------------------+----------------+--------------+

Some common service combinations include:

* ``lms``: LMS, along with dependencies ``forum``, ``discovery``, and some databases
* ``ecommerce``: Ecommerce, but also LMS as a dependency (for auth)
* ``studio+credentials``: Services can be combined to affect both at once

.. _credentials: https://github.com/edx/credentials
.. _discovery: https://github.com/edx/course-discovery
.. _ecommerce: https://github.com/edx/ecommerce
.. _edx_notes_api: https://github.com/edx/edx-notes-api
.. _forum: https://github.com/edx/cs_comments_service
.. _frontend-app-payment: https://github.com/edx/frontend-app-payment
.. _frontend-app-publisher: https://github.com/edx/frontend-app-publisher
.. _frontend-app-gradebook: https://github.com/edx/frontend-app-gradebook
.. _lms: https://github.com/edx/edx-platform
.. _frontend-app-program-console: https://github.com/edx/frontend-app-program-console
.. _registrar: https://github.com/edx/registrar
.. _studio: https://github.com/edx/edx-platform
.. _lms: https://github.com/edx/edx-platform
.. _frontend-app-learning: https://github.com/edx/frontend-app-learning
.. _frontend-app-library-authoring: https://github.com/edx/frontend-app-library-authoring
.. _frontend-app-course-authoring: https://github.com/edx/frontend-app-course-authoring
.. _frontend-app-account: https://github.com/edx/frontend-app-account
.. _xqueue: https://github.com/edx/xqueue
.. _coursegraph: https://github.com/edx/edx-platform/tree/master/openedx/core/djangoapps/coursegraph


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
(e.g. ``COMPOSE_PROJECT_NAME=devstack-juniper.master``. Should you want to manually override this, edit the ``options.local.mk`` in the root of this repo and create the file if it does not exist. Change the devstack project name by adding the following line::

   # Example: COMPOSE_PROJECT_NAME=secondarydevstack
   COMPOSE_PROJECT_NAME=<your-alternate-devstack-name>

As a specific example, if ``OPENEDX_RELEASE`` is set in your environment as ``juniper.master``, then ``COMPOSE_PROJECT_NAME`` will default to ``devstack-juniper.master`` instead of ``devstack``.

.. _Docker Compose: https://docs.docker.com/compose/
.. _Docker for Mac: https://docs.docker.com/docker-for-mac/
.. _Docker for Windows: https://docs.docker.com/docker-for-windows/
.. _configuring Docker for Mac: https://docs.docker.com/docker-for-mac/#/advanced
.. _feature added in Docker 17.05: https://github.com/edx/configuration/pull/3864
.. _edx-e2e-tests README: https://github.com/edx/edx-e2e-tests/#how-to-run-lms-and-studio-tests
.. _edxops Docker image: https://hub.docker.com/r/edxops/
.. _Docker Hub: https://hub.docker.com/
.. _Pycharm Integration documentation: docs/pycharm_integration.rst
.. _devpi documentation: docs/devpi.rst
.. _edx-platform testing documentation: https://github.com/edx/edx-platform/blob/master/docs/guides/testing/testing.rst#running-python-unit-tests
.. |Build Status provisioning| image:: https://github.com/edx/devstack/actions/workflows/provisioning-tests.yml/badge.svg?branch=master
    :target: https://github.com/edx/devstack/actions/workflows/provisioning-tests.yml
    :alt: Provisioning tests
.. |Build Status CLI| image:: https://github.com/edx/devstack/actions/workflows/cli-tests.yml/badge.svg?branch=master
    :target: https://github.com/edx/devstack/actions/workflows/cli-tests.yml
    :alt: CLI tests
.. |docs| image:: https://readthedocs.org/projects/docs/badge/?version=latest
    :alt: Documentation Status
    :scale: 100%
    :target: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/
.. _Python virtualenv: https://docs.python-guide.org/en/latest/dev/virtualenvs/#lower-level-virtualenv
.. _Community: https://open.edx.org/community/connect/

