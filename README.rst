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
| `marketing`_                       | http://localhost:8080/              | PHP/Drupal     | edX.org-only |
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
.. _marketing: https://github.com/edx/edx-mktg
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

Frequently Asked Questions
--------------------------

How do I run the images for a named Open edX release?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
By default, the steps above will install the devstack using the master branch of all repos. If you want to install a named release instead, follow these steps before pulling the docker images in `step 3`_ of the Getting Started guide:

#. Set the ``OPENEDX_RELEASE`` environment variable to the appropriate image
   tag; "hawthorn.master", "zebrawood.rc1", etc.  Note that unlike a server
   install, ``OPENEDX_RELEASE`` should not have the "open-release/" prefix.
#. Check out the appropriate branch in devstack, e.g. ``git checkout open-release/ironwood.master``
#. Use ``make dev.checkout`` to check out the correct branch in the local
   checkout of each service repository
#. Continue with `step 3`_ in the Getting Started guide to pull the correct docker images.

All ``make`` target and ``docker-compose`` calls should now use the correct
images until you change or unset ``OPENEDX_RELEASE`` again.  To work on the
master branches and ``latest`` images, unset ``OPENEDX_RELEASE`` or set it to
an empty string.

How do I run multiple named Open edX releases on same machine?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
You can have multiple isolated Devstacks provisioned on a single computer now. Follow these directions **after installing at least two devstacks** to switch between them.

#. If you haven't done so, follow the steps in the `Getting Started`_ section, to install the master devstack or any other named release. We recommend that you have at least one devstack on the master branch.
#. Change directory to your devstack and activate the virtual env.
#. Stop any running containers by issuing a ``make dev.stop``.
#. Follow the steps in `Getting Started`_ section again, setting the additional OPENEDX_RELEASE you want to install in step 2

The implication of this is that you can switch between isolated Devstack databases by changing the value of the ``OPENEDX_RELEASE`` environment variable.

Switch between your Devstack releases by doing the following:
*************************************************************

#. Stop the containers by issuing a ``make dev.stop`` for the running release.
#. Edit the project name in ``options.local.mk`` or set the ``OPENEDX_RELEASE`` environment variable and let the ``COMPOSE_PROJECT_NAME`` be assigned automatically.
#. Check out the appropriate branch in devstack, e.g. ``git checkout open-release/ironwood.master``
#. Use ``make dev.checkout`` to check out the correct branch in the local
   copy of each service repository
#. Bring up the containers with ``make dev.up``, ``make dev.nfs.up`` or ``make dev.sync.up``.

**NOTE:** Additional instructions on switching releases using ``direnv`` can be found in `How do I switch releases using 'direnv'?`_ section.

Examples of Docker Service Names After Setting the ``COMPOSE_PROJECT_NAME`` variable. Notice that the **devstack-juniper.master** name represents the ``COMPOSE_PROJECT_NAME``.

-  edx.devstack-juniper.master.lms
-  edx.devstack-juniper.master.mysql

Each instance has an isolated set of databases. This could, for example, be used to quickly switch between versions of Open edX without hitting as many issues with migrations, data integrity, etc.

Unfortunately, this **does not** currently support running Devstacks simultaneously, because we hard-code host port numbers all over the place, and two running containers cannot share the same host port.

Questions & Troubleshooting – Multiple Named Open edX Releases on Same Machine
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This broke my existing Devstack!
********************************
 See if the troubleshooting of this readme can help resolve your broken devstack first, then try posting on the `Open edX forums <https://discuss.openedx.org>`__ to see if you have the same issue as any others. If you think you have found a bug, file a CR ticket.

I’m getting errors related to ports already being used.
*******************************************************
Make sure you bring down your devstack before changing the value of COMPOSE_PROJECT_NAME. If you forgot to, change the COMPOSE_PROJECT_NAME back to its original value, run ``make dev.stop``, and then try again.

I have custom scripts/compose files that integrate with or extend Devstack. Will those still work?
**************************************************************************************************
With the default value of COMPOSE_PROJECT_NAME = devstack, they should still work. If you choose a different COMPOSE_PROJECT_NAME, your extensions will likely break, because the names of containers change along with the project name.

How do I switch releases using 'direnv'?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Follow directions in `Switch between your Devstack releases by doing the following:`_ then make the following adjustments.

Make sure that you have setup each Open edX release in separate directories using `How do I enable environment variables for current directory using 'direnv'?`_ instructions. Open the next release project in a separate code editor, then activate the ``direnv`` environment variables and virtual environment for the next release by using a terminal shell to traverse to the directory with the corresponding release ``.envrc`` file. You may need to issue a ``direnv allow`` command to enable the ``.envrc`` file.

    .. code:: sh

        # You should see something like the following after successfully enabling 'direnv' for the Juniper release.

        direnv: loading ~/open-edx/devstack.juniper/.envrc
        direnv: export +DEVSTACK_WORKSPACE +OPENEDX_RELEASE +VIRTUAL_ENV ~PATH
        (venv)username@computer-name devstack.juniper %

**NOTE:** Setting of the ``OPENEDX_RELEASE`` should have been handled within the ``.envrc`` file for named releases only and should not be defined for the ``master`` release.

How do I enable environment variables for current directory using 'direnv'?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
We recommend separating the named releases into different directories, for clarity purposes. You can use `direnv <https://direnv.net/>`__ to define different environment variables per directory::

    .. code::

        # Example showing directory structure for separate Open edX releases.

        /Users/<username>/open-edx – root directory for platform development
        |_ ./devstack.master  – directory containing all repository information related to the main development release.
        |_ ./devstack.juniper – directory containing all repository information related to the Juniper release.

#. Install `direnv` using instructions on https://direnv.net/. Below you will find additional setup at the time of this writing so refer to latest of `direnv` site for additional configuration needed.

#. Setup the following configuration to hook `direnv` for local directory environment overrides. There are two examples for BASH or ZSH (Mac OS X) shells.

    .. code:: sh

        ## ~/.bashrc for BASH shell

        ## Hook in `direnv` for local directory environment overrides.
        ## https://direnv.net/docs/hook.html
        eval "$(direnv hook bash)"

        # https://github.com/direnv/direnv/wiki/Python#bash
        show_virtual_env() {
        if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
            echo "($(basename $VIRTUAL_ENV))"
        fi
        }
        export -f show_virtual_env
        PS1='$(show_virtual_env)'$PS1

        # ---------------------------------------------------

        ## ~/.zshrc for ZSH shell for Mac OS X.

        ## Hook in `direnv` for local directory environment setup.
        ## https://direnv.net/docs/hook.html
        eval "$(direnv hook zsh)"

        # https://github.com/direnv/direnv/wiki/Python#zsh
        setopt PROMPT_SUBST

        show_virtual_env() {
        if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
            echo "($(basename $VIRTUAL_ENV))"
        fi
        }
        PS1='$(show_virtual_env)'$PS1

#. Setup `layout_python-venv` function to be used in local project directory `.envrc` file.

    .. code:: sh

        ## ~/.config/direnv/direnvrc

        # https://github.com/direnv/direnv/wiki/Python#venv-stdlib-module

        realpath() {
            [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
        }
        layout_python-venv() {
            local python=${1:-python3}
            [[ $# -gt 0 ]] && shift
            unset PYTHONHOME
            if [[ -n $VIRTUAL_ENV ]]; then
                VIRTUAL_ENV=$(realpath "${VIRTUAL_ENV}")
            else
                local python_version
                python_version=$("$python" -c "import platform; print(platform.python_version())")
                if [[ -z $python_version ]]; then
                    log_error "Could not detect Python version"
                    return 1
                fi
                VIRTUAL_ENV=$PWD/.direnv/python-venv-$python_version
            fi
            export VIRTUAL_ENV
            if [[ ! -d $VIRTUAL_ENV ]]; then
                log_status "no venv found; creating $VIRTUAL_ENV"
                "$python" -m venv "$VIRTUAL_ENV"
            fi

            PATH="${VIRTUAL_ENV}/bin:${PATH}"
            export PATH
        }

#. Example `.envrc` file used in project directory. Need to make sure that each release root has this unique file.

    .. code:: sh

        # Open edX named release project directory root.
        ## <project-path>/devstack.juniper/.envrc

        # https://discuss.openedx.org/t/docker-devstack-multiple-releases-one-machine/1902/10

        # This is handled when OPENEDX_RELEASE is set. Leaving this in for manual override.
        # export COMPOSE_PROJECT_NAME=devstack-juniper

        export DEVSTACK_WORKSPACE="$(pwd)"
        export OPENEDX_RELEASE=juniper.master
        export VIRTUAL_ENV="$(pwd)/devstack/venv"

        # https://github.com/direnv/direnv/wiki/Python#virtualenv
        layout python-venv

How do I define my own local targets?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you'd like to add some convenience make targets, you can add them to a ``local.mk`` file, ignored by git.

How do I make payments?
~~~~~~~~~~~~~~~~~~~~~~~

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

How do I develop on an installed Python package?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you want to modify an installed package – for instance ``edx-enterprise`` or ``completion`` – clone the repository in
``~/workspace/src/your-package``. Next, ssh into the appropriate docker container (``make lms-shell``),
run ``pip install -e /edx/src/your-package``, and restart the service.

How do I upgrade Python packages?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
  then download and use the updated image (for example, via ``make dev.pull.<service>``).
  The discovery and edxapp images are built automatically via a Jenkins job. All other
  images are currently built as needed by edX employees, but will soon be built
  automatically on a regular basis. See `building images for devstack`_ for more information.
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

How do I upgrade Node.js packages?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

JavaScript packages for Node.js are installed into the ``node_modules``
directory of the local git repository checkout which is synced into the
corresponding Docker container.  Hence these can be upgraded via any of the
usual methods for that service (``npm install``,
``paver install_node_prereqs``, etc.), and the changes will persist between
container restarts.

How do I rebuild static assets?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Optimized static assets are built for all the Open edX services during
provisioning, but you may want to rebuild them for a particular service
after changing some files without re-provisioning the entire devstack.  To
do this, run the ``make dev.static.<service>`` target.  For example:

.. code:: sh

   make dev.static.credentials

To rebuild static assets for all service containers:

.. code:: sh

   make dev.static

How do I enable comprehensive theming?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Following directions `Changing Themes for an Open edX Site`_ to get started. You can create your theme inside the ``${DEVSTACK_WORKSPACE}/edx-themes`` local directory as this maps to the Docker container ``/edx/app/edx-themes`` location.

Devstack Envs Configuration
********************************
Make sure that you enable the following code in ./edx-platform/lms/envs/devstack.py as this will make sure that you have the appropriate Mako template overrides applied for your theme. Forgetting to enable this will not allow your theme template files to be overriden by the platform. See `discuss 3557 <https://discuss.openedx.org/t/enable-comprehensive-theming-devstack-mako-template-overrides-not-working/3557>`__ for details concerning issues with not enabling the following code. 

.. code:: python

   ########################## THEMING  #######################
   # If you want to enable theming in devstack, uncomment this section and add any relevant
   # theme directories to COMPREHENSIVE_THEME_DIRS

   # We have to import the private method here because production.py calls
   # derive_settings('lms.envs.production') which runs _make_mako_template_dirs with
   # the settings from production, which doesn't include these theming settings. Thus,
   # the templating engine is unable to find the themed templates because they don't exist
   # in it's path. Re-calling derive_settings doesn't work because the settings was already
   # changed from a function to a list, and it can't be derived again.

   from .common import _make_mako_template_dirs
   ENABLE_COMPREHENSIVE_THEMING = True
   COMPREHENSIVE_THEME_DIRS = [
       "/edx/app/edxapp/edx-platform/themes/",
       "/edx/app/edx-themes"
   ]
   TEMPLATES[1]["DIRS"] = _make_mako_template_dirs
   derive_settings(__name__)

How do I connect to the databases from an outside editor?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To connect to the databases from an outside editor (such as MySQLWorkbench),
first uncomment these lines from ``docker-compose.yml``'s ``mysql`` section:

.. code:: yaml

  ports:
    - "3506:3306"

Then connect using the values below. Note that the username and password will
vary depending on the database. For all of the options, see ``provision.sql``.

- Host: ``localhost``
- Port: ``3506``
- Username: ``edxapp001``
- Password: ``password``

If you have trouble connecting, ensure the port was mapped successfully by
running ``make dev.ps`` and looking for a line like this:
``edx.devstack.mysql docker-entrypoint.sh mysql ... Up 0.0.0.0:3506→3306/tcp``.

How do I run the edX.org Drupal Marketing Site?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The edX.org marketing site built on Drupal is being deprecated, but it can still be run via Devstack.
See the `Marketing Site instructions`_ for details on getting it up and running.
This will not be useful to those outside of edX, Inc, as the marketing site is closed-source
and is not built with Open edX usage in mind.


How do I build the service images myself?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See the instructions for `building images for devstack`_.

How do I create relational database dumps?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See the instructions for `updating relational database dumps`_.

How do I keep my database up to date?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To run Django migrations for a particular service, bring up the service and use
``make dev.migrate.<service>``. For example:

.. code:: sh

   make dev.up.studio
   make dev.migrate.studio

To run migrations for all services at once, run:

.. code:: sh

   make dev.up
   make dev.migrate

Alternatively, you can discard and rebuild the entire database for all
devstack services by re-running ``make dev.provision`` or
``make dev.sync.provision`` as appropriate for your configuration.  Note that
if your branch has fallen significantly behind master, it may not include all
of the migrations included in the database dump used by provisioning.  In these
cases, it's usually best to first rebase the branch onto master to
get the missing migrations.

How do I access a database shell?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To access a MongoDB shell, run the following commands:

.. code:: sh

   make dev.shell.mongo
   mongo

To access the MySQL shell for a particular database, run:

.. code:: sh

   make dev.shell.mysql
   mysql
   use <database>;

Equivalently, you can use the command ``make dev.dbshell.<database>`` as a shortcut. For example,
this will put you in a MySQL shell using the E-Commerce database:

.. code:: sh

  make dev.dbshell.ecommerce

How do I create new migrations?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For LMS, log into the LMS shell and run the
``makemigrations`` command with the ``devstack_docker`` settings:

.. code:: sh

   make dev.shell.lms
   ./manage.py lms makemigrations <appname> --settings=devstack_docker

For Studio, it is similar:

.. code:: sh

   make dev.shell.studio
   ./manage.py cms makemigrations <appname> --settings=devstack_docker

Finally, for any other service, run:

.. code:: sh

   make dev.shell.<service>
   ./manage.py makemigrations <appname>

Also, make sure you are aware of the `Django Migration Don'ts`_ as the
edx-platform is deployed using the red-black method.

Switching branches
~~~~~~~~~~~~~~~~~~

You can usually switch branches on a service's repository without adverse
effects on a running container for it.  The service in each container is
using runserver and should automatically reload when any changes are made
to the code on disk.  However, note the points made above regarding
database migrations and package updates.

When switching to a branch which differs greatly from the one you've been
working on (especially if the new branch is more recent), you may wish to
halt and remove the existing containers via ``make down``, pull the latest Docker
images via ``make dev.pull.<service>``, and then re-run ``make dev.provision`` or
``make dev.sync.provision`` in order to recreate up-to-date databases,
static assets, etc.

If making a patch to a named release, you should pull and use Docker images
which were tagged for that release.

Changing LMS/Studio settings
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

LMS and Studio (a.k.a. CMS) read many configuration settings from the container filesystem
in the following locations:

- ``/edx/etc/lms.yml``
- ``/edx/etc/studio.yml``

Changes to these files will *not* persist over a container restart, as they
are part of the layered container filesystem and not a mounted volume. However, you
may need to change these settings and then have the LMS or Studio pick up the changes.

After changing settings, you can restart the LMS/Studio process without restarting the container by running the following on your host machine:

.. code:: sh

   make dev.restart-devserver.lms     # For LMS
   make dev.restart-devserver.studio  # For Studio/CMS

How do I integrate with PyCharm?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See the `Pycharm Integration documentation`_.

What is DevPI and how does it affect Devstack?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

LMS and Studio use a devpi container to cache PyPI dependencies, which speeds up several Devstack operations.
See the `devpi documentation`_.

Testing and Debugging
---------------------

Debugging using PDB
~~~~~~~~~~~~~~~~~~~

It's possible to debug any of the containers' Python services using PDB. To do so,
start up the containers as usual with:

.. code:: sh

    make dev.up

This command starts each relevant container with the equivalent of the '--it' option,
allowing a developer to attach to the process once the process is up and running.

To attach to a container and its process, use ``make dev.attach.<service>``. For example:

.. code:: sh

    make dev.attach.lms

Set a PDB breakpoint anywhere in the code using one of the following:

.. code:: sh

    breakpoint()                # Works in Python >= 3.7
    import pdb;pdb.set_trace()  # Workg in any version of Python

and your attached session will offer an interactive PDB prompt when the breakpoint is hit.

You may be able to detach from the container with the ``Ctrl-P, Ctrl-Q`` key sequence.
If that doesn't work, you will have either close your terminal window or
stop the service with:

.. code:: sh

    make dev.stop.<service>

You can bring that same service back up with:

.. code:: sh

    make dev.up.<service>

Running LMS and Studio Tests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Tests can also be easily run with a shortcut from the host machine,
so that you maintain your command history:

.. code:: sh

    ./in lms pytest openedx/core/djangoapps/user_api

Connecting to Browser
*********************

If you want to see the browser being automated for JavaScript or bok-choy tests,
you can connect to the container running it via VNC.

+------------------------+----------------------+
| Browser                | VNC connection       |
+========================+======================+
| Firefox (Default)      | vnc://0.0.0.0:25900  |
+------------------------+----------------------+
| Chrome (via Selenium)  | vnc://0.0.0.0:15900  |
+------------------------+----------------------+

On macOS, enter the VNC connection string in the address bar in Safari to
connect via VNC. The VNC passwords for both browsers are randomly generated and
logged at container startup, and can be found by running ``make vnc-passwords``.

Most tests are run in Firefox by default.  To use Chrome for tests that normally
use Firefox instead, prefix the test command with
``SELENIUM_BROWSER=chrome SELENIUM_HOST=edx.devstack.chrome``.

Running End-to-End Tests
~~~~~~~~~~~~~~~~~~~~~~~~

To run the base set of end-to-end tests for edx-platform, run the following
make target:

.. code:: sh

   make e2e-tests

If you want to use some of the other testing options described in the
`edx-e2e-tests README`_, you can instead start a shell for the e2e container
and run the tests manually via paver:

.. code:: sh

    make e2e-shell
    paver e2e_test

The browser running the tests can be seen and interacted with via VNC as
described above (Firefox is used by default).

Troubleshooting: General Tips
-----------------------------

If you are having trouble with your containers, this sections contains some troubleshooting tips.

Check the logs
~~~~~~~~~~~~~~

If a container stops unexpectedly, you can look at its logs for clues::

    make dev.logs.<service>

Update the code and images
~~~~~~~~~~~~~~~~~~~~~~~~~~

Make sure you have the latest code and Docker images.

Pull the latest Docker images by running the following command from the devstack
directory:

.. code:: sh

   make dev.pull

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
``make dev.down`` to remove all containers and networks. This will **NOT** remove your
data volumes.

Reset to a sane state
~~~~~~~~~~~~~~~~~~~~~

Sometimes you just aren't sure what's wrong, if you would like to hit the reset button
run ``make dev.reset``.

Running this command will perform the following steps:

* Bring down all containers
* Reset all git repositories to the HEAD of master
* Pull new images for all services
* Compile static assets for all services
* Run migrations for all services

This does not delete your data and you do not need to re-provision after running it.
It can be good to try this before asking for help.

Re-provision individual database(s)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you botched a migration for a service, or just want to start with a clean database for
a service *without* re-provisioning every single service, you can drop that service's
database and re-provision it.

1. Drop the correct database (see ``provision.sql`` for the full list of database names):

.. code:: sh

    make dev.drop-db.<database>

2. Re-provision the service(s):

.. code:: sh

    make dev.provision.<services>

For example, if you messed up just your Course Discovery and Registrar databases, you could try running:

.. code:: sh

    make dev.drop-db.discovery
    make dev.drop-db.registrar
    make dev.provision.discovery+registrar

Start over
~~~~~~~~~~

If you want to completely start over, run ``make dev.destroy``. This will remove
all containers, networks, AND data volumes, requiring you to re-provision.

Troubleshooting: Common Issues
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
``devstack``. If you run into issues running ``paver`` commands in a docker container, you should append
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

If you see the error ``no space left on device``, Docker has run
out of space in its Docker.qcow2 file.

Here is an example error while running ``make dev.pull``:

.. code:: sh

   ...
   32d52c166025: Extracting [==================================================>] 1.598 GB/1.598 GB
   ERROR: failed to register layer: Error processing tar file(exit status 1): write /edx/app/edxapp/edx-platform/.git/objects/pack/pack-4ff9873be2ca8ab77d4b0b302249676a37b3cd4b.pack: no space left on device
   make: *** [pull] Error 1

Try this first to clean up dangling images:

.. code:: sh

   docker system prune -f  # (This is very safe, so try this first.)

If you are still seeing issues, you can try cleaning up dangling volumes.

1. Bring up all containers.

.. code:: sh

   make dev.up

2. Remove all unused volumes. **Warning:** this will remove all Docker data on your system that is *not currently in use by a container*, which is why it's important to run the previous step. Otherwise, this will wipe out your Devstack data.

   docker volume prune -f

No such file or directory
~~~~~~~~~~~~~~~~~~~~~~~~~

While provisioning, some have seen the following error:

.. code:: sh

   ...
   cwd = os.getcwdu()
   OSError: [Errno 2] No such file or directory
   make: *** [dev.provision.services] Error 1

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
this error is due to running out of memory.  Try increasing the memory
allocated to Docker.

Docker is using lots of CPU time when it should be idle
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On the Mac, this often manifests as the ``hyperkit`` process using a high
percentage of available CPU resources.  To identify the container(s)
responsible for the CPU usage:

.. code:: sh

    make dev.stats

Once you've identified a container using too much CPU time, check its logs;
for example:

.. code:: sh

    make dev.logs.lms

The most common culprit is an infinite restart loop where an error during
service startup causes the process to exit, but we've configured
``docker-compose`` to immediately try starting it again (so the container will
stay running long enough for you to use a shell to investigate and fix the
problem).  Make sure the set of packages installed in the container matches
what your current code branch expects; you may need to rerun ``pip`` on a
requirements file or pull new container images that already have the required
package versions installed.

Missing git branches
~~~~~~~~~~~~~~~~~~~~

When trying to check out a branch, you may see an error like this::

    git checkout jj/REV-666-implement-evil-feature
    > error: pathspec 'jj/REV-666-implement-evil-feature' did not match any file(s) known to git

If you are sure you have (i) recently run ``git fetch`` and (ii) didn't misspell the
branch name, then it is possible your repository is set in "single-branch" mode, meaning
that it is configured to only fetch ``master``. Although devstack currently clones services'
repositories with all their branches, devstacks provisioned before September 2020
will start out with single-branch repositories. You check if your repository is in this
state by running ``git branch -r``. If you only see a couple of entries
(``origin/master`` and ``origin/HEAD``), then your local repository is in single-branch
mode.

You can manually reconfigure your repository to pull all branches by running these
commands from within the repository::

    git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
    git fetch origin
    git checkout jj/REV-666-implement-evil-feature
    > Switched to branch 'jj/REV-666-implement-evil-feature'.

General git troubleshooting
~~~~~~~~~~~~~~~~~~~~~~~~~~~

``git`` is powerful but complex; you may occasionally find your respository in a
confusing state. This problem isn't devstack-specific.

If you find yourself stuck, folks in the edX-internal or Open edX Slack workspaces may
be able to give you a hand.

Alternatively, if you are at a roadblock and
*don't care about any changes you've made to your local copy of the repository*
(i.e., you have pushed or otherwise saved your work elsewhere)
then you can always delete the repository and start over again::

    rm -rf ./<repository>
    git clone git@github.com:edx/<repository>

Finally, if you regularly find yourself mystified by git, consider reading
through `Understanding Git Conceptually`_. It explains core Git principles in way
that makes it easier to use the simpler ``git`` commands more effectively
and easier to use the more complicated ``git`` commands when you have to.


Troubleshooting: Performance
----------------------------

Improve Mac OSX Performance using nfs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The option to use docker with nfs on mac was added recently. This can potentially increase performance in mac osx. However, this option is still in testing phase. If you find any corrections that should be made, please start a PR with corrections.


Improve Mac OSX Performance with docker-sync
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


**NOTE:**

docker-sync is no longer actively supported. See section for nfs above for
possible alternative.

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
.. _Marketing site instructions: https://openedx.atlassian.net/wiki/spaces/ENG/pages/159162183/Marketing+Site
.. _updating relational database dumps: docs/database-dumps.rst
.. _building images for devstack: docs/building-images.rst
.. _Understanding Git Conceptually: https://www.sbf5.com/~cduan/technical/git/
.. _Changing Themes for an Open edX Site: https://edx.readthedocs.io/projects/edx-installing-configuring-and-running/en/latest/configuration/changing_appearance/theming/index.html
