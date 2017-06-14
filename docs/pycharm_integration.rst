PyCharm Integration
-------------------

The Professional edition of JetBrains `PyCharm`_ IDE, version 2017.1 or later,
can be used to develop and debug with Docker and Docker Compose.

See additional information and tips for `PyCharm IDE setup`_.


**Important**: Please complete all the steps above for provisioning your
Docker Devstack environment before proceeding with the following setup.


**Warning**: It is important to ensure that all Docker images are
stopped outside of PyCharm before starting a server or tests from inside
PyCharm. PyCharm will potentially disable the start button with no
further error when this problem occurs. See `Jetbrains ticket
PY-22893 <https://youtrack.jetbrains.com/issue/PY-22893>`__.


**Warning**: If you are on a Mac, make sure you are on a newer version
than macOS Yosemite. A this time, this should work with either El
Capitan or Sierra.

Setup a Remote Interpreter
~~~~~~~~~~~~~~~~~~~~~~~~~~

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

- Service: lms (or whatever IDE you wish to test)

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


**Important** If you are running with Docker Sync you will also need to first
run ``docker-sync start`` to run sync in the background before running any servers.


**Note**: For lms and studio (edx-platform), it will take a long time to
update skeletons (10 or more minutes). If you want to try a different
set of configuration (compose) files, we recommend you create a new one
so you can easily switch back to old without this delay.


**Warning**: When you change configuration files, the service dropdown gets
reset. Remember to restore to the IDA you wish to test.

Setup a Server Run/Debug Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

After configuring the interpreter, you should setup a `Django Server
Run/Debug Configuration`_. Note that there are some specific values that should
be used for this configuration.

The host should always be set to ``0.0.0.0`` so that Django accepts
requests from external clients (e.g. your Docker host). The port should
be set to the service-specific port from the table above.

*Note*: See next section for additional changes needed for LMS and
Studio.

Setup a Server Run/Debug Configuration for LMS or Studio
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For LMS and Studio, the setup is a hack because we (unfortunately)
modified ``manage.py``.

Add a new Run/Debug Configuration of type "Django server", with the
following options:

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

Setup a Configuration to Run/Debug python tests for LMS or Studio
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run and debug unit tests, create a "Django server" type Run/Dubug
configuration with the following options:

1. Host: "" (no text)

2. Port: "" (no text)

3. Additional Options: --settings test_docker test lms/djangoapps/courseware/tests/test_views.py

4. Check "Custom run command:" and enter either ``lms`` or ``cms`` in to the text box.

5. Environment Variables:

    - DJANGO_SETTINGS_MODULE=lms.envs.test_docker
    - DISABLE_MIGRATIONS=1
    - PYTHONUNBUFFERED=1

6. Python Interpreter: Choose the Docker Compose interpreter for this
   service.

7. Working directory: /edx/app/edxapp/edx-platform

8. Path mappings (add mapping):

   - Local path: LOCAL/PATH/TO/edx-platform (e.g. ~/edx/edx-platform)
   - Remote path: /edx/app/edxapp/edx-platform

9. Deselect "Add content..." and "Add source..."

**Tip**: You can adjust the default configuration if you will be
replicating this.

Setup a Django tests Run/Debug Configuration for an IDA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run and debug unit tests, create a "Django tests" type Run/Dubug
configuration with the following options:

1. Target: lms.djangoapps.grades.tests.test_grades:TestGradeIteration

2. Environment Variables:

    - DJANGO_SETTINGS_MODULE=lms.envs.test_docker
    - DISABLE_MIGRATIONS=1
    - PYTHONUNBUFFERED=1

3. Working directory: /edx/app/edxapp/edx-platform

4. Path mappings (add mapping):

   - Local path: LOCAL/PATH/TO/edx-platform (e.g. ~/edx/edx-platform)
   - Remote path: /edx/app/edxapp/edx-platform

5. Deselect "Add content..." and "Add source..."

**Tip**: You can adjust the default configuration if you will be
replicating this.

Currently not supported for PyCharm Development
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Debugging for BokChoy
- Debugging for JavaScript
- Cython for fasterdebug

.. _PyCharm: https://www.jetbrains.com/pycharm/
.. _PyCharm IDE setup: https://openedx.atlassian.net/wiki/display/ENG/PyCharm
.. _vendor documentation: https://www.jetbrains.com/help/pycharm/2017.1/configuring-remote-interpreters-via-docker-compose.html
.. _Django Server Run/Debug Configuration: https://www.jetbrains.com/help/pycharm/2017.1/run-debug-configuration-django-server.html
