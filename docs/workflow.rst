Workflow
========

Here's a common workflow you might use in devstack for feature development or debugging in an IDA.

These instructions are written using the LMS as an example. Replace ``lms`` with ``cms``, ``credentials``, ``discovery``, etc. as appropriate.

#. Get your IDA's repo ready for development.

   - You'll be developing from a git repo that is checked out to the same parent directory as the one devstack is in. For example, if you have ``~/edx-repos/devstack``, you'll be developing the LMS in ``~/edx-repos/edx-platform``.

   - Make sure your IDA's repo is checked out to the commit you want to use for development, and that that commit is based on an up to date branch, so that it matches the disk images devstack will pull.

#. Launch your service in a clean state:

   #. Run ``make dev.remove-containers dev.pull.lms dev.up.lms`` to halt any running services and remove their containers, pull the latest disk images, and launch your service.
   #. Optionally, watch ``make dev.logs.lms`` to follow the logs. This lets you see when the service finishes coming up, and prints the port it is listening on.

      - Your service is up when you see a block of messages that looks like the following::

          edx.devstack.lms                  | System check identified no issues (0 silenced).
          edx.devstack.lms                  | November 25, 2020 - 19:04:18
          edx.devstack.lms                  | Django version 2.2.17, using settings 'lms.envs.devstack_docker'
          edx.devstack.lms                  | Starting development server at http://0.0.0.0:18000/
          edx.devstack.lms                  | Quit the server with CONTROL-C.

      - If the logs show warning messages about missing tables or needed migrations, run ``make dev.migrate.lms`` and then continue

      - If there are complaints about import failures, Python package requirements may have changed since the last disk image. Run ``make lms-shell`` and then ``make requirements`` from inside the shell, then restart the service with ``make dev.restart-devserver.lms``.

#. Your service should now be up and accessible, and you can develop in your IDA's repo. When you make changes on disk, a file watcher will restart the service in devstack. It may take a moment for the service to come back up with your changes.

   - For some changes, this auto-restarting is insufficient, and you'll need to make a change from inside ``make lms-shell`` (such as ``make requirements`` or a migrations or other management command) and then run ``make dev.restart-devserver.lms`` from the outside. Running ``make dev.restart-devserver.lms`` may also fix issues if the runserver command is not restarting automatically after code changes.

#. When you're done, you can run ``make dev.stop.lms`` to shut down the service but leave the container intact (with requirements installations and other file changes preserved).

Variations
----------

Multiple services
~~~~~~~~~~~~~~~~~

If you're working on multiple services at a time, you can use Make targets of a different form that take a list of services. For example, if you want to pull images for ``lms``, ``cms``, and ``credentials``, you can run ``make dev.pull.lms+cms+credentials``. This will pull down images for the three services, as well as for all of their runtime dependencies.

You can also use the more tab-completion-friendly commands separately: ``make lms-pull cms-pull credentials-pull``.

Time-savers
~~~~~~~~~~~

If you want to pull down just the images for one service but not its dependencies, there is a ``without-deps`` variant for both pulling images and for bringing a service up, and for both service-leading and service-trailing Make target variants. For example, ``dev.up.without-deps.lms`` and ``lms-up-without-deps`` may both be used, where the former is more amenable to use with multiple services at the same time.

Database backups
~~~~~~~~~~~~~~~~

You can routinely create backups of your local databases. To create a backup, use ``make dev.backup``. When you want to restore you database to the backup, run ``make dev.restore``. Warning, this will restore all your databases. You might have to cycle the database containers off and on using ``make dev.remove-containers.<database service name>`` and ``make dev.up.<database service name>``.

Comprehensive backup
~~~~~~~~~~~~~~~~~~~~

You can also back up and restore *all* devstack-related volumes -- not just databases, but also node_modules and static assets volumes. (These commands currently only work on Linux.)

- Back up: ``make stop && sudo rsync -savx --numeric-ids --include='/devstack_***' --exclude='*' --delete /var/lib/docker/volumes/ .dev/backups/2023-07-18/``
- Restore: ``make stop && sudo rsync -savx --numeric-ids --include='/devstack_***' --exclude='*' --delete .dev/backups/2023-07-18/ /var/lib/docker/volumes/``

The above example creates and restores from a backup directory named ``2023-07-18`` and assumes that you're working from the master branch; if you're working from a named release or have explicitly specified an alternative ``COMPOSE_PROJECT_NAME``, you'll need to adjust the ``--include`` parameter.

Containers should be stopped before the backup or restore is performed, or databases are very likely to become corrupted.

Running micro-frontends outside of devstack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Although several micro-frontends (MFEs) are built into devstack (the full list is in :doc:`service_list`), some users prefer to run those MFEs directly on their host machine. You can achieve this by first removing the devstack MFE container, and then starting the host version. For example::

  make dev.down.frontend-app-learning  # Bring down the devstack version of the Learning MFE.
  cd <path-to-frontend-app-learning>   # Navigate to the Learning MFE's repository.
  npm ci && npm start                  # Install JS packages, and start the NPM devserver on your local host.

Of course ``learning`` can be replaced with ``gradebook``, ``payment``, or another frontend-app name.

If you forget to bring down the devstack version of the MFE, you will notice a port conflict when trying to start the host version.
