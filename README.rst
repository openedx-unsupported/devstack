Open edX Devstack |Build Status|
================================

Get up and running quickly with Open edX services.

If you are seeking info on the Vagrant-based devstack, please see
https://openedx.atlassian.net/wiki/display/OpenOPS/Running+Devstack. This
project is meant to replace the traditional Vagrant-based devstack with a
multi-container approach driven by `Docker Compose`_. It is still in the
beta testing phase.

Support
-------

Tickets or issues should be filed in Jira under the platform project:
https://openedx.atlassian.net/projects/PLAT/issues

FYI
---

You should run any ``make`` targets described below on your local machine, *not*
from within a VM.

Prerequisites
-------------

This project requires **Docker 17.06+ CE**.  We recommend Docker Stable, but
Docker Edge should work as well.

**NOTE:** Switching between Docker Stable and Docker Edge will remove all images and
settings.  Don't forget to restore your memory setting and be prepared to
provision.

For macOS users, please use `Docker for Mac`_. Previous Mac-based tools (e.g.
boot2docker) are *not* supported.

`Docker for Windows`_ may work but has not been tested and is *not* supported.

Linux users should *not* be using the ``overlay`` storage driver.  ``overlay2``
is tested and supported, but requires kernel version 4.0+.  Check which storage
driver your docker-daemon is configured to use:

.. code:: sh

   docker info | grep -i 'storage driver'

You will also need the following installed:

- make
- python pip (optional for MacOS)

Using the Latest Images
-----------------------

New images for our services are published frequently.  Assuming that you've followed the steps in `Getting Started`_
below, run the following sequence of commands if you want to use the most up-to-date versions of the devstack images.

.. code:: sh

    make down
    make pull
    make dev.up

This will stop any running devstack containers, pull the latest images, and then start all of the devstack containers.

Getting Started
---------------

All of the services can be run by following the steps below.

**NOTE:** Since a Docker-based devstack runs many containers,
you should configure Docker with a sufficient
amount of resources. Our testing found that `configuring Docker for Mac`_ with
a minimum of 2 CPUs and 4GB of memory works well.

1. Install the requirements (optional for MacOS).

   This is not required for Docker for Mac, since it comes with
   ``docker-compose`` out of the box.

   .. code:: sh

      make requirements

2. The Docker Compose file mounts a host volume for each service's executing
   code. The host directory defaults to be a sibling of this directory. For
   example, if this repo is cloned to ``~/workspace/devstack``, host volumes
   will be expected in ``~/workspace/course-discovery``,
   ``~/workspace/ecommerce``, etc. These repos can be cloned with the command
   below.

   .. code:: sh

       make dev.clone

   You may customize where the local repositories are found by setting the
   DEVSTACK\_WORKSPACE environment variable.

3. Run the provision command, if you haven't already, to configure the various
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


4. Start the services. This command will mount the repositories under the
   DEVSTACK\_WORKSPACE directory.

   **NOTE:** it may take up to 60 seconds for the LMS to start, even after the ``make dev.up`` command outputs ``done``.

   Default:

   .. code:: sh

       make dev.up

   Start using `docker-sync`_:

   .. code:: sh

       make dev.sync.up


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
For example, to access the logs for Ecommerce, you can run:

.. code:: sh

    make ecommerce-logs

To reset your environment and start provisioning from scratch, you can run:

.. code:: sh

    make destroy

For information on all the available ``make`` commands, you can run:

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

If you'd like to add some convenience make targets, you can add them to a ``local.mk`` file, ignored by git.

Payments
--------

The ecommerce image comes pre-configured for payments via CyberSource and PayPal. Additionally, the provisioning scripts
add the demo course (``course-v1:edX+DemoX+Demo_Course``) to the ecommerce catalog. You can initiate a checkout by visiting
http://localhost:18130/basket/add/?sku=8CF08E5 or clicking one of the various upgrade links in the LMS. The following
details can be used for checkout. While the name and address fields are required for credit card payments, their values
are not checked in development, so put whatever you want in those fields.

- Card Type: Visa
- Card Number: 4111111111111111
- CVN: 123 (or any three digits)
- Expiry Date: 06/2025 (or any date in the future)

PayPal (same for username and password): devstack@edx.org

Marketing Site
--------------

Docker Compose files useful for integrating with the edx.org marketing site are
available. This will NOT be useful to those outside of edX. For details on
getting things up and running, see
https://openedx.atlassian.net/wiki/display/OpenDev/Marketing+Site.

How do I build images?
----------------------

There are `Docker CI Jenkins jobs`_ on tools-edx-jenkins that build and push new
Docker images to DockerHub on code changes to either the configuration repository or the IDA's codebase. These images
are tagged ``latest``. Images that require tags other than ``latest`` are built and pushed by hand (see NOTES below).
If you want to build the images on your own, the Dockerfiles are available in the ``edx/configuration`` repo.

NOTES:

1. We are experimenting with hosting a ``Dockerfile`` in the ``edx/credentials`` repository, hence the ``devstack-slim``
   tag. See that repo for more information on building its image.
2. edxapp and IDAs use the ``latest`` tag since their configuration changes have been merged to master branch of
   ``edx/configuration``.
3. The elasticsearch used in devstack is built using elasticsearch-devstack/Dockerfile and the ``devstack`` tag.

BUILD COMMANDS:

.. code:: sh

    git checkout master
    git pull
    docker build -f docker/build/edxapp/Dockerfile . -t edxops/edxapp:latest

.. code:: sh

    git checkout master
    git pull
    docker build -f docker/build/ecommerce/Dockerfile . -t edxops/ecommerce:devstack

The build commands above will use your local configuration, but will pull
application code from the master branch of the application's repository. If you
would like to use code from another branch/tag/hash, modify the ``*_VERSION``
variable that lives in the ``ansible_overrides.yml`` file beside the
``Dockerfile``. Note that edx-platform is an exception; the variable to modify is ``edx_platform_version``
and not ``EDXAPP_VERSION``.

For example, if you wanted to build tag ``release-2017-03-03`` for the
E-Commerce Service, you would modify ``ECOMMERCE_VERSION`` in
``docker/build/ecommerce/ansible_overrides.yml``.

How do I create database dumps?
-------------------------------
We use database dumps to speed up provisioning and generally spend less time running migrations. These dumps should be
updated occasionally - when database migrations take a prolonged amount of time *or* we want to incorporate changes that
require manual intervention.

To update the database dumps:

1. Destroy and/or backup the data for your existing devstack so that you start with a clean slate.
2. Disable the loading of the existing database dumps during provisioning by commenting out any calls to ``load-db.sh``
   in the provisioning scripts. This disabling ensures a start with a completely fresh database and incorporates any changes
   that may have required some form of manual intervention for existing installations (e.g. drop/move tables).
3. Provision devstack with ``make provision``.
4. Dump the databases and open a pull request with your updates:

.. code:: sh

   ./dump-db.sh ecommerce
   ./dump-db.sh edxapp
   ./dump-db.sh edxapp_csmh

How do I keep my database up to date?
-------------------------------------

You can run Django migrations as normal to apply any changes recently made
to the database schema for a particular service.  For example, to run
migrations for LMS, enter a shell via ``make lms-shell`` and then run:

.. code:: sh

   paver update_db

Alternatively, you can discard and rebuild the entire database for all
devstack services by re-running ``make dev.provision`` or
``make dev.sync.provision`` as appropriate for your configuration.  Note that
if your branch has fallen significantly behind master, it may not include all
of the migrations included in the database dump used by provisioning.  In these
cases, it's usually best to first rebase the branch onto master to
get the missing migrations.

How do I make migrations?
-------------------------

Log into the LMS shell, source the ``edxapp`` virtualenv, and run the
``makemigrations`` command with the ``devstack_docker`` settings:

.. code:: sh

   make lms-shell
   source /edx/app/edxapp/edxapp_env
   cd /edx/app/edxapp/edx-platform
   ./manage.py <lms/cms> makemigrations <appname> --settings=devstack_docker

Also, make sure you are aware of the `Django Migration Don'ts`_ as the
edx-platform is deployed using the red-black method.


How do I upgrade Node.JS packages?
----------------------------------

JavaScript packages for Node.js are installed into the ``node_modules``
directory of the local git repository checkout which is synced into the
corresponding Docker container.  Hence these can be upgraded via any of the
usual methods for that service (``npm install``,
``paver install_node_prereqs``, etc.), and the changes will persist between
container restarts.

How do I upgrade Python packages?
---------------------------------

Unlike the ``node_modules`` directory, the ``virtualenv`` used to run Python
code in a Docker container only exists inside that container.  Changes made to
a container's filesystem are not saved when the container exits, so if you
manually install or upgrade Python packages in a container (via
``pip install``, ``paver install_python_prereqs``, etc.), they will no
longer be present if you restart the container.  (Devstack Docker containers
lose changes made to the filesystem when you reboot your computer, run
``make down``, restart or upgrade Docker itself, etc.) If you want to ensure
that your new or upgraded packages are present in the container every time it
starts, you have a few options:

* Merge your updated requirements files and wait for a new `edxops Docker image`_
  for that service to be built and uploaded to `Docker Hub`_.  You can
  then download and use the updated image (for example, via ``make pull``).
  The discovery and edxapp images are buit automatically via a Jenkins job. All other
  images are currently built as needed by edX employees, but will soon be built
  automatically on a regular basis. See `How do I build images?`_
  for more information.
* You can update your requirements files as appropriate and then build your
  own updated image for the service as described above, tagging it such that
  ``docker-compose`` will use it instead of the last image you downloaded.
  (Alternatively, you can temporarily edit ``docker-compose.yml`` to replace
  the ``image`` entry for that service with the ID of your new image.) You
  should be sure to modify the variable override for the version of the
  application code used for building the image. See `How do I build images?`_.
  for more information.
* You can temporarily modify the main service command in
  ``docker-compose.yml`` to first install your new package(s) each time the
  container is started.  For example, the part of the studio command which
  reads ``...&& while true; do...`` could be changed to
  ``...&& pip install my-new-package && while true; do...``.
* In order to work on locally pip-installed repos like edx-ora2, first clone
  them into ``../src`` (relative to this directory). Then, inside your lms shell,
  you can ``pip install -e /edx/src/edx-ora2``. If you want to keep this code
  installed across stop/starts, modify ``docker-compose.yml`` as mentioned
  above.

How do I rebuild static assets?
-------------------------------

Optimized static assets are built for all the Open edX services during
provisioning, but you may want to rebuild them for a particular service
after changing some files without re-provisioning the entire devstack.  To
do this, run the make target for the appropriate service.  For example:

.. code:: sh

   make credentials-static

To rebuild static assets for all service containers:

.. code:: sh

   make static

Switching branches
------------------

You can usually switch branches on a service's repository without adverse
effects on a running container for it.  The service in each container is
using runserver and should automatically reload when any changes are made
to the code on disk.  However, note the points made above regarding
database migrations and package updates.

When switching to a branch which differs greatly from the one you've been
working on (especially if the new branch is more recent), you may wish to
halt the existing containers via ``make down``, pull the latest Docker
images via ``make pull``, and then re-run ``make dev.provision`` or
``make dev.sync.provision`` in order to recreate up-to-date databases,
static assets, etc.

If making a patch to a named release, you should pull and use Docker images
which were tagged for that release.

Changing LMS/CMS settings
-------------------------
The LMS and CMS read many configuration settings from the container filesystem
in the following locations:

- ``/edx/app/edxapp/lms.env.json``
- ``/edx/app/edxapp/lms.auth.json``
- ``/edx/app/edxapp/cms.env.json``
- ``/edx/app/edxapp/cms.auth.json``

Changes to these files will *not* persist over a container restart, as they
are part of the layered container filesystem and not a mounted volume. However, you
may need to change these settings and then have the LMS or CMS pick up the changes.

To restart the LMS/CMS process without restarting the container, kill the LMS or CMS
process and the watcher process will restart the process within the container. You can
kill the needed processes from a shell within the LMS/CMS container with a single line of bash script:

LMS:

.. code:: sh

    kill -9 $(ps aux | grep 'manage.py lms' | egrep -v 'while|grep' | awk '{print $2}')

CMS:

.. code:: sh

    kill -9 $(ps aux | grep 'manage.py cms' | egrep -v 'while|grep' | awk '{print $2}')

From your host machine, you can also run ``make lms-restart`` or
``make studio-restart`` which run those commands in the containers for you.

PyCharm Integration
-------------------

See the `Pycharm Integration documentation`_.

Debugging using PDB
-------------------

It's possible to debug any of the containers' Python services using PDB. To do so,
start up the containers as usual with:

.. code:: sh

    make dev.up

This command starts each relevant container with the equivalent of the '--it' option,
allowing a developer to attach to the process once the process is up and running.

To attach to the LMS/Studio containers and their process, use either:

.. code:: sh

    make lms-attach
    make studio-attach

Set a PDB breakpoint anywhere in the code using:

.. code:: sh

    import pdb;pdb.set_trace()

and your attached session will offer an interactive PDB prompt when the breakpoint is hit.

To detach from the container, you'll need to stop the container with:

.. code:: sh

    make stop

or a manual Docker command to bring down the container:

.. code:: sh

   docker kill $(docker ps -a -q --filter="name=edx.devstack.<container name>")

Running LMS and Studio Tests
----------------------------

After entering a shell for the appropriate service via ``make lms-shell`` or
``make studio-shell``, you can run any of the usual paver commands from the
`edx-platform testing documentation`_.  Examples:

.. code:: sh

    paver run_quality
    paver test_a11y
    paver test_bokchoy
    paver test_js
    paver test_lib
    paver test_python

Tests can also be run individually. Example:

.. code:: sh

    pytest openedx/core/djangoapps/user_api

Connecting to Browser
~~~~~~~~~~~~~~~~~~~~~

If you want to see the browser being automated for JavaScript or bok-choy tests,
you can connect to the container running it via VNC.

+------------------------+----------------------+
| Browser                | VNC connection       |
+========================+======================+
| Firefox (Default)      | vnc://0.0.0.0:25900  |
+------------------------+----------------------+
| Chrome (via Selenium)  | vnc://0.0.0.0:15900  |
+------------------------+----------------------+

On macOS, enter the VNC connection string in Safari to connect via VNC. The VNC
passwords for both browsers are randomly generated and logged at container
startup, and can be found by running ``make vnc-passwords``.

Most tests are run in Firefox by default.  To use Chrome for tests that normally
use Firefox instead, prefix the test command with
``SELENIUM_BROWSER=chrome SELENIUM_HOST=edx.devstack.chrome``.

Running End-to-End Tests
------------------------

To run the base set of end-to-end tests for edx-platform, run the following
make target:

.. code:: sh

   make e2e-tests

If you want to use some of the other testing options described in the
`edx-e2e-tests README`_, you can instead start a shell for the e2e container
and run the tests manually via paver:

.. code:: sh

    make e2e-shell
    paver e2e_test --exclude="whitelabel\|enterprise"

The browser running the tests can be seen and interacted with via VNC as
described above (Chrome is used by default).

Troubleshooting: General Tips
-----------------------------

If you are having trouble with your containers, this sections contains some troubleshooting tips.

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
``make down`` to remove all containers and networks. This will **NOT** remove your
data volumes.

Reset
~~~~~

Somtimes you just aren't sure what's wrong, if you would like to hit the reset button
run ``make dev.reset``.

Running this command will perform the following steps:

* Bring down all containers
* Reset all git repositories to the HEAD of master
* Pull new images for all services
* Compile static assets for all services
* Run migrations for all services

It's good to run this before asking for help.

Start over
~~~~~~~~~~

If you want to completely start over, run ``make destroy``. This will remove
all containers, networks, AND data volumes.

Resetting a database
~~~~~~~~~~~~~~~~~~~~

In case you botched a migration or just want to start with a clean database.

1. Open up the mysql shell and drop the database for the desired service::

    make mysql-shell
    mysql
    DROP DATABASE (insert database here)

2. From your devstack directory, run the provision script for the service. The
   provision script should handle populating data such as Oauth clients and
   Open edX users and running migrations::

    ./provision-(service_name)


Troubleshooting: Common issues
------------------------------

File ownership change
~~~~~~~~~~~~~~~~~~~~~

If you notice that the ownership of some (maybe all) files have changed and you
need to enter your root password when editing a file, you might
have pulled changes to the remote repository from within a container. While running
``git pull``, git changes the owner of the files that you pull to the user that runs
that command. Within a container, that is the root user - so git operations
should be ran outside of the container.

To fix this situation, change the owner back to yourself outside of the container by running:

.. code:: sh

  $ sudo chown <user>:<group> -R .

Running LMS commands within a container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Most of the ``paver`` commands require a settings flag. If omitted, the flag defaults to
``devstack``, which is the settings flag for vagrant-based devstack instances.
So if you run into issues running ``paver`` commands in a docker container, you should append
the ``devstack_docker`` flag. For example:

.. code:: sh

  $ paver update_assets --settings=devstack_docker

Resource busy or locked
~~~~~~~~~~~~~~~~~~~~~~~

While running ``make static`` within the ecommerce container you could get an error
saying:

.. code:: sh

  Error: Error: EBUSY: resource busy or locked, rmdir '/edx/app/ecommerce/ecommerce/ecommerce/static/build/'

To fix this, remove the directory manually outside of the container and run the command again.

No space left on device
~~~~~~~~~~~~~~~~~~~~~~~

If you see the error ``no space left on device`` on a Mac, Docker has run
out of space in its Docker.qcow2 file.

Here is an example error while running ``make pull``:

.. code:: sh

   ...
   32d52c166025: Extracting [==================================================>] 1.598 GB/1.598 GB
   ERROR: failed to register layer: Error processing tar file(exit status 1): write /edx/app/edxapp/edx-platform/.git/objects/pack/pack-4ff9873be2ca8ab77d4b0b302249676a37b3cd4b.pack: no space left on device
   make: *** [pull] Error 1

You can clean up data by running ``docker system prune``, but you will first want
to run ``make dev.up`` so it doesn't delete stopped containers.

Or, you can run the following commands to clean up dangling images and volumes:

.. code:: sh

   docker image prune -f
   docker volume prune -f  # (Be careful, this will remove your persistent data!)

No such file or directory
~~~~~~~~~~~~~~~~~~~~~~~~~

While provisioning, some have seen the following error:

.. code:: sh

   ...
   cwd = os.getcwdu()
   OSError: [Errno 2] No such file or directory
   make: *** [dev.provision.run] Error 1

This issue can be worked around, but there's no guaranteed method to do so.
Rebooting and restarting Docker does *not* seem to correct the issue. It
may be an issue that is exacerbated by our use of sync (which typically speeds
up the provisioning process on Mac), so you can try the following:

.. code:: sh

   # repeat the following until you get past the error.
   make stop
   make dev.provision

Once you get past the issue, you should be able to continue to use sync versions
of the make targets.

Memory Limit
~~~~~~~~~~~~

While provisioning, some have seen the following error:

.. code:: sh

   ...
   Build failed running pavelib.assets.update_assets: Subprocess return code: 137

This error is an indication that your docker process died during execution.  Most likely,
this error is due to running out of memory. If your Docker configuration is set to 2GB (docker for mac default),
increase it to 4GB (the current recommendation). If your Docker configuration is set to 4GB, then try 6GB.

Performance
-----------

Improve Mac OSX Performance with docker-sync
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Docker for Mac has known filesystem issues that significantly decrease
performance for certain use cases, for example running tests in edx-platform. To
improve performance, `Docker Sync`_  can be used to synchronize file data from
the host machine to the containers.

Many developers have opted not to use `Docker Sync`_ because it adds complexity
and can sometimes lead to issues with the filesystem getting out of sync.

You can swap between using Docker Sync and native volumes at any time, by using
the make targets with or without 'sync'. However, this is harder to do quickly
if you want to switch inside the PyCharm IDE due to its need to rebuild its
cache of the containers' virtual environments.

If you are using macOS, please follow the `Docker Sync installation
instructions`_ before provisioning.

Docker Sync Troubleshooting tips
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Check your version and make sure you are running 0.4.6 or above:

.. code:: sh

    docker-sync --version

If not, upgrade to the latest version:

.. code:: sh

    gem update docker-sync

If you are having issues with docker sync, try the following:

.. code:: sh

    make stop
    docker-sync stop
    docker-sync clean

Cached Consistency Mode
~~~~~~~~~~~~~~~~~~~~~~~

The performance improvements provided by `cached consistency mode for volume
mounts`_ introduced in Docker CE Edge 17.04 are still not good enough. It's
possible that the "delegated" consistency mode will be enough to no longer need
docker-sync, but this feature hasn't been fully implemented yet (as of
Docker 17.12.0-ce, "delegated" behaves the same as "cached").  There is a
GitHub issue which explains the `current status of implementing delegated consistency mode`_.

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
.. _edx-platform testing documentation: https://github.com/edx/edx-platform/blob/master/docs/testing.rst#running-python-unit-tests
.. _docker-sync: #improve-mac-osx-performance-with-docker-sync
.. |Build Status| image:: https://travis-ci.org/edx/devstack.svg?branch=master
    :target: https://travis-ci.org/edx/devstack
    :alt: Travis
.. _Docker CI Jenkins Jobs: https://tools-edx-jenkins.edx.org/job/DockerCI
.. _How do I build images?: https://github.com/edx/devstack/tree/master#how-do-i-build-images
   :target: https://travis-ci.org/edx/devstack
.. _Django Migration Don'ts: https://engineering.edx.org/django-migration-donts-f4588fd11b64
