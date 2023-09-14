Developing on Open edX named release branches
=============================================

.. contents:: Table of Contents

By default, the startup steps in :doc:`getting_started` will install the devstack using the master branch of all repos. If you want to install a named release instead, follow these steps before the step that pulls the docker images:

#. Set the ``OPENEDX_RELEASE`` environment variable to the appropriate image
   tag; "hawthorn.master", "zebrawood.rc1", etc.  Note that unlike a server
   install, ``OPENEDX_RELEASE`` should not have the "open-release/" prefix.
#. Check out the appropriate branch in devstack, e.g. ``git checkout open-release/ironwood.master``
#. Use ``make dev.checkout`` to check out the correct branch in the local
   checkout of each service repository
#. Continue with step 3 in :doc:`getting_started` to pull the correct docker images.

All ``make`` target and ``docker compose`` calls should now use the correct
images until you change or unset ``OPENEDX_RELEASE`` again.  To work on the
master branches and ``latest`` images, unset ``OPENEDX_RELEASE`` or set it to
an empty string.
Note that older versions of devstack may have different prerequisites. In particular,
releases before Quince will need support for the ``docker-compose`` syntax as
well as the newer ``docker compose``. The easiest way to do this is to add
is to add a shell script with the following and put it on the PATH under the name docker-compose:

    .. code:: sh

        #!/bin/bash
        docker compose "$@"

How do I run multiple named Open edX releases on same machine?
--------------------------------------------------------------
You can have multiple isolated Devstacks provisioned on a single computer now. Follow these directions **after installing at least two devstacks** to switch between them.

#. If you haven't done so, follow the steps in :doc:`getting_started`, to install the master devstack or any other named release. We recommend that you have at least one devstack on the master branch.
#. Change directory to your devstack and activate the virtual env.
#. Stop any running containers by issuing a ``make dev.stop``.
#. Follow the steps in :doc:`getting_started` again, setting the additional OPENEDX_RELEASE you want to install in step 2

The implication of this is that you can switch between isolated Devstack databases by changing the value of the ``OPENEDX_RELEASE`` environment variable.

Switch between your Devstack releases by doing the following:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Stop the containers by issuing a ``make dev.stop`` for the running release.
#. Edit the project name in ``options.local.mk`` or set the ``OPENEDX_RELEASE`` environment variable and let the ``COMPOSE_PROJECT_NAME`` be assigned automatically.
#. Check out the appropriate branch in devstack, e.g. ``git checkout open-release/ironwood.master``
#. Use ``make dev.checkout`` to check out the correct branch in the local
   copy of each service repository
#. Bring up the containers with ``make dev.up``.

**NOTE:** Additional instructions on switching releases using ``direnv`` can be found in `How do I switch releases using 'direnv'?`_ section.

Examples of Docker Service Names After Setting the ``COMPOSE_PROJECT_NAME`` variable. Notice that the **devstack-juniper.master** name represents the ``COMPOSE_PROJECT_NAME``.

-  edx.devstack-juniper.master.lms
-  edx.devstack-juniper.master.mysql57

Each instance has an isolated set of databases. This could, for example, be used to quickly switch between versions of Open edX without hitting as many issues with migrations, data integrity, etc.

Unfortunately, this **does not** currently support running Devstacks simultaneously, because we hard-code host port numbers all over the place, and two running containers cannot share the same host port.

Questions & Troubleshooting – Multiple Named Open edX Releases on Same Machine
------------------------------------------------------------------------------

This broke my existing Devstack!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 See if the troubleshooting of this readme can help resolve your broken devstack first, then try posting on the `Open edX forums <https://discuss.openedx.org>`__ to see if you have the same issue as any others. If you think you have found a bug, file a CR ticket.

I’m getting errors related to ports already being used.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Make sure you bring down your devstack before changing the value of COMPOSE_PROJECT_NAME. If you forgot to, change the COMPOSE_PROJECT_NAME back to its original value, run ``make dev.stop``, and then try again.

I have custom scripts/compose files that integrate with or extend Devstack. Will those still work?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
With the default value of COMPOSE_PROJECT_NAME = devstack, they should still work. If you choose a different COMPOSE_PROJECT_NAME, your extensions will likely break, because the names of containers change along with the project name.

How do I switch releases using 'direnv'?
----------------------------------------

Follow directions in `Switch between your Devstack releases by doing the following:`_ then make the following adjustments.

Make sure that you have setup each Open edX release in separate directories using `How do I enable environment variables for current directory using 'direnv'?`_ instructions. Open the next release project in a separate code editor, then activate the ``direnv`` environment variables and virtual environment for the next release by using a terminal shell to traverse to the directory with the corresponding release ``.envrc`` file. You may need to issue a ``direnv allow`` command to enable the ``.envrc`` file.

    .. code:: sh

        # You should see something like the following after successfully enabling 'direnv' for the Juniper release.

        direnv: loading ~/open-edx/devstack.juniper/.envrc
        direnv: export +DEVSTACK_WORKSPACE +OPENEDX_RELEASE +VIRTUAL_ENV ~PATH
        (venv)username@computer-name devstack.juniper %

**NOTE:** Setting of the ``OPENEDX_RELEASE`` should have been handled within the ``.envrc`` file for named releases only and should not be defined for the ``master`` release.

How do I enable environment variables for current directory using 'direnv'?
---------------------------------------------------------------------------
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
