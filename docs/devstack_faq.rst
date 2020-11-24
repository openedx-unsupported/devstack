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
       "/edx/app/edx-themes/edx-platform/"
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