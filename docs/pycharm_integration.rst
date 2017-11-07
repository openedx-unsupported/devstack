PyCharm Integration
===================

The Professional edition of JetBrains `PyCharm`_ IDE, version 2017.1.2 or later,
can be used to develop and debug with Docker and Docker Compose.

Additional PyCharm tips are kept in this `PyCharm IDE setup`_ documentation.

Prerequisites
-------------

1. You must complete all steps for provisioning your Docker Devstack environment
   in the `README`_ before proceeding with the PyCharm setup.

2. If you are on a Mac, make sure you are on a newer version than macOS
   Yosemite. A this time, this should work with either El Capitan or Sierra.

Before running Run or Debug in PyCharm
--------------------------------------

Every time you run/debug a server or test in PyCharm, you must first ensure the
following:

1. Ensure that all Docker images are stopped outside of PyCharm before starting
   a server or tests from inside PyCharm. PyCharm will potentially disable the
   start button with no further error when this problem occurs. See `Jetbrains
   ticket PY-22893`_.

2. If you are running with Docker Sync on a mac you will want to first run
   ``docker-sync start`` to run sync in the background before running any
   servers or tests.

Setup a Remote Interpreter
--------------------------

Follow the `vendor documentation`_ for the necessary steps to add a Docker
Compose remote interpreter. In the Remote Python Interpreter dialog,
use the following options:

- If you need to add a server (e.g. Docker for Mac), you should be able to Add and choose defaults.

  - On a Mac, you'll need to use "API URL: unix:///var/run/docker.sock" (with 3 slashes).

- Configuration files(s)

  - Docker Sync (Mac)

    - ``/LOCAL/PATH/TO/devstack/docker-compose.yml`` (e.g.~/edx/devstack/docker-compose.yml)
    - ``/LOCAL/PATH/TO/devstack/docker-compose-sync.yml``

  - Without Docker Sync

    - ``/LOCAL/PATH/TO/devstack/docker-compose.yml`` (e.g.~/edx/devstack/docker-compose.yml)
    - ``/LOCAL/PATH/TO/devstack/docker-compose-host.yml``

- Service: lms (or whatever IDA you wish to test)

- Environment variables:

  - ``DEVSTACK_WORKSPACE=/LOCAL/PARENT/PATH/TO/workspace`` (i.e.: Path to where your local repositories are cloned)

- Python interpreter path:

  - The remote path should be set to the service's virtual environment:

    - ``/edx/app/<SERVICE_NAME>/venvs/<SERVICE_NAME>/bin/python``

  - For example, the path would be the following for the Credentials Service:

    - ``/edx/app/credentials/venvs/credentials/bin/python``

  - For either lms or studio, you need to use edxapp:

    - ``/edx/app/edxapp/venvs/edxapp/bin/python``

- PyCharm helpers path: Keep the default.

**Note**: For lms and studio (edx-platform), it will take a long time to
update skeletons (10 or more minutes). If you want to try a different
set of configuration (compose) files, we recommend you create a new one
so you can easily switch back to old without this delay.

**Warning**: When you change configuration files, the service drop-down gets
reset. Remember to restore to the IDA you wish to test.

Setup Django Support
--------------------

Before setting up a Server/Debug configuration you will need to setup Django
Support for the specific Project (e.g. LMS and Studio, or ecommerce)

PyCharm -> Preferences -> Languages & Frameworks -> Django

Here are some example settings you might use:

Django Project Root: /Path/to/docker_devstack/ecommerce
Settings: ecommerce/settings/devstack.py
Manage Script: manage.py

Setup a Server Run/Debug Configuration
--------------------------------------

The setup for Server Run/Debug Configurations depends on the service.

Server Run/Debug Configuration for an IDA (not LMS or Studio)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After configuring the interpreter, add a new `Django Server Run/Debug
Configuration`_, with the following specific values.

The host should always be set to ``0.0.0.0`` so that Django accepts
requests from external clients (e.g. your Docker host). The port should
be set to the service-specific port from the table above.

*Note*: See next section for additional changes needed for LMS and
Studio.

Setup a Server Run/Debug Configuration for ecommerce
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add the following Environment Variables to the Server configuration, these are all
defined on the ecommerce server in /edx/app/ecommerce/ecommerce_env

.. code-block::

  export PATH="/edx/app/ecommerce/nodeenvs/ecommerce/bin:/edx/app/ecommerce/venvs/ecommerce/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
  export ECOMMERCE_CFG="/edx/etc/ecommerce.yml"
  export DJANGO_SETTINGS_MODULE="ecommerce.settings.devstack"


Setup a Server Run/Debug Configuration for LMS or Studio
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For LMS and Studio, the setup is a hack because we (unfortunately)
modified ``manage.py``.

After configuring the interpreter, add a new `Django Server Run/Debug
Configuration`_, with the following specific values.

1. Leave host/port blank

2. Additional options: runserver 0.0.0.0:18000 (or runserver
   0.0.0.0:18010)

3. Custom run command: lms (or cms)

4. Environment variables, add the following for lms/studio:

   - ``DJANGO_SETTINGS_MODULE=lms.envs.devstack_docker`` (or
     cms.envs.devstack_docker)
   - ``PYTHONUNBUFFERED=1``

5. Python Interpreter: Choose the Docker Compose interpreter for this
   service.

6. Working directory: /edx/app/edxapp/edx-platform

7. Path mappings (add mapping):

   - Local path: /LOCAL/PATH/TO/edx-platform (e.g. ~/edx/edx-platform)
   - Remote path: /edx/app/edxapp/edx-platform

8. Deselect "Add content..." and "Add source..."

Setup a Run/Debug Configuration for python tests
------------------------------------------------

The setup for a Run/Debug Configurations for python tests depends on the
service.

**Tip**: You can adjust the default configuration with settings you are most
likely to replicate.

Setup a Run/Debug Configuration for python tests for an IDA (not LMS or Studio)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run and debug unit tests, create a **"Django tests"** type Run/Dubug
configuration with the following options:

1. Target: lms.djangoapps.grades.tests.test_grades:TestGradeIteration

2. Environment Variables:

    - DJANGO_SETTINGS_MODULE=lms.envs.test
    - DISABLE_MIGRATIONS=1
    - PYTHONUNBUFFERED=1

3. Working directory: /edx/app/edxapp/edx-platform

4. Path mappings (add mapping):

   - Local path: LOCAL/PATH/TO/edx-platform (e.g. ~/edx/edx-platform)
   - Remote path: /edx/app/edxapp/edx-platform

5. Deselect "Add content..." and "Add source..."

Setup a Run/Debug Configuration for python tests for LMS or Studio
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run and debug unit tests, edit the **"Defaults -> Python tests -> py.test"** type Run/Dubug
configuration with the following options:

1. Python Interpreter: Choose the Docker Compose interpreter for this
   service.

2. Working directory: /edx/app/edxapp/edx-platform

3. Path mappings (add mapping):

   - Local path: LOCAL/PATH/TO/edx-platform (e.g. ~/edx/edx-platform)
   - Remote path: /edx/app/edxapp/edx-platform

4. Deselect "Add content..." and "Add source..."

Then make two changes in PyCharm's preferences:

1. Set "Tools -> Python Integrated Tools -> Default test runner" to "py.test".

2. In "Languages & Frameworks -> Django", uncheck "Enable Django Support".
   Starting in PyCharm 2017.3 (the EAP of which is already available), this
   dialog has a "Do not use Django test runner" checkbox which should be
   enabled instead.

You should now be able to execute tests via the context menu of test files,
classes, or individual test cases.  You can also run custom sets of tests by
creating a custom py.test Run/Debug configuration (which should now be
initialized with the defaults above) and setting its "Target" appropriately.

Currently not supported for PyCharm Development
-----------------------------------------------

- Debugging for BokChoy
- Debugging for JavaScript
- Cython for fasterdebug

Troubleshooting
---------------

General Tips
~~~~~~~~~~~~

1. Ensure that you have fulfilled all of the `Prerequisites`_.

2. Ensure you have completed all steps in `Before running Run or Debug in
   PyCharm`_ each time you run the server or tests.

3. PyCharm is often fixing bugs around the relatively new docker-compose
   integration.  If PyCharm has an update, install it.

Can't create Python SDK
~~~~~~~~~~~~~~~~~~~~~~~

While working in PyCharm, you could see the following error:

.. code-block::

   The command '/bin/sh -c mv /user/bin/docker-compose /user/bin/docker-compose-original' returned a non-zero code: 1

This issue has been fixed in PyCharm 2017.1.2.

Project Interpreter has no packages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you had added an interpreter that was working, but you can no longer see a
list of packages for it under Preferences, you may need to refresh it.

One way to do this is to follow these instructions:

1. Go to Preferences => Project Interpreter

2. Click the "..." button to the right of the "Project interpreter:" drop-down,
   and choose "More...".

3. Click the Edit button (pencil icon) at the bottom for the broken interpreter,
   and then click OK on all dialogs, without making any edits.

.. _Django Server Run/Debug Configuration: https://www.jetbrains.com/help/pycharm/2017.1/run-debug-configuration-django-server.html
.. _Jetbrains ticket PY-22893: https://youtrack.jetbrains.com/issue/PY-22893
.. _PyCharm: https://www.jetbrains.com/pycharm/
.. _PyCharm IDE setup: https://openedx.atlassian.net/wiki/spaces/OpenDev/pages/92209229/PyCharm
.. _README: ../README.rst
.. _vendor documentation: https://www.jetbrains.com/help/pycharm/2017.1/configuring-remote-interpreters-via-docker-compose.html
