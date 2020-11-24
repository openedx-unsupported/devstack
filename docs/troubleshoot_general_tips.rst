Troubleshooting: Common Issues
==============================

.. contents:: Table of Contents

File ownership change
---------------------

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
---------------------------------------

Most of the ``paver`` commands require a settings flag. If omitted, the flag defaults to
``devstack``. If you run into issues running ``paver`` commands in a docker container, you should append
the ``devstack_docker`` flag. For example:

.. code:: sh

  $ paver update_assets --settings=devstack_docker

Resource busy or locked
-----------------------

While running ``make static`` within the ecommerce container you could get an error
saying:

.. code:: sh

  Error: Error: EBUSY: resource busy or locked, rmdir '/edx/app/ecommerce/ecommerce/ecommerce/static/build/'

To fix this, remove the directory manually outside of the container and run the command again.

No space left on device
-----------------------

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
-------------------------

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
------------

While provisioning, some have seen the following error:

.. code:: sh

   ...
   Build failed running pavelib.assets.update_assets: Subprocess return code: 137

This error is an indication that your docker process died during execution.  Most likely,
this error is due to running out of memory.  Try increasing the memory
allocated to Docker.

Docker is using lots of CPU time when it should be idle
-------------------------------------------------------

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
--------------------

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
---------------------------

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
-------------------------------------

The option to use docker with nfs on mac was added recently. This can potentially increase performance in mac osx. However, this option is still in testing phase. If you find any corrections that should be made, please start a PR with corrections.


Improve Mac OSX Performance with docker-sync
--------------------------------------------


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
--------------------------------
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
-----------------------

The performance improvements provided by `cached consistency mode for volume
mounts`_ introduced in Docker CE Edge 17.04 are still not good enough. It's
possible that the "delegated" consistency mode will be enough to no longer need
docker-sync, but this feature hasn't been fully implemented yet (as of
Docker 17.12.0-ce, "delegated" behaves the same as "cached").  There is a
GitHub issue which explains the `current status of implementing delegated consistency mode`_.

.. _Understanding Git Conceptually: https://www.sbf5.com/~cduan/technical/git/
.. _Docker Sync: https://github.com/EugenMayer/docker-sync/wiki
.. _Docker Sync installation instructions: https://github.com/EugenMayer/docker-sync/wiki/1.-Installation
.. _cached consistency mode for volume mounts: https://docs.docker.com/docker-for-mac/osxfs-caching/
.. _current status of implementing delegated consistency mode: https://github.com/docker/for-mac/issues/1592
