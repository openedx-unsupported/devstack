Building Images for Devstack
============================

There are `Docker CI Jenkins jobs`_ on tools-edx-jenkins that build and push new
Docker images to DockerHub on code changes to either the configuration repository or the IDA's codebase. These images
are tagged according to the branch from which they were built (see NOTES below).
If you want to build the images on your own, the Dockerfiles are available in the ``edx/configuration`` repo.

NOTES:

1. edxapp and IDAs use the ``latest`` tag for configuration changes which have been merged to master branch of
   their repository and ``edx/configuration``.
2. Images for a named Open edX release are built from the corresponding branch
   of each repository and tagged appropriately, for example ``hawthorn.master``
   or ``hawthorn.rc1``.
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

.. _Docker CI Jenkins Jobs: https://tools-edx-jenkins.edx.org/job/DockerCI
