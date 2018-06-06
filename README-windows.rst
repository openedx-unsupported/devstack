Open edX Devstack on Windows (Alpha)
====================================

System Requirements
-------------------

* Windows 10 1803 (Spring 2018)

  * This has been tested on the Spring 2018 release of Windows 10 only

* Developer Mode enabled https://docs.microsoft.com/en-us/windows/uwp/get-started/enable-your-device-for-development

  * Needed to allow git to create symlinks

* Docker for Windows

* Git and Git bash from git-scm.org

Provisioning Devstack
---------------------

Run the following commands in Git bash. Currently make is not working, so we're running commands manually

.. code:: sh

    git clone git@github.com:edx/devstack.git
    cd devstack
    export DEVSTACK_WORKSPACE=$(pwd)/..
    ./repo.sh clone
    DOCKER_COMPOSE_FILES="-f docker-compose.yml -f docker-compose-host.yml" winpty bash ./provision.sh
