Devstack Interface
------------------

Devstack comes built in with many useful make commands that act as an user interface. This UI is essentially a make wrapper around ``docker compose`` commands. We attempt to give a short summary of what the make commands do below, but it would be a good idea for you to familiarize yourself with some knowledge of docker compose.

Due to the organic nature of how this user interface came into being, there are often multiple ways to do the same thing. The two main variants of commands are of the form: ``dev.ACTION.SERVICE`` vs ``SERVICE-ACTION``. The ``SERVICE-ACTION`` variant tends to be more tab-completion friendly.

Examples:

.. code:: sh

    make dev.up.registrar
    make registrar-up

    make dev.shell.lms
    make lms-shell

    make dev.logs.frontend-app-gradebook
    make frontend-app-gradebook-logs

The user interface for devstack often also gives you both big hammers (``make dev.pull.large-and-slow``) and small hammers (``make dev.pull.<service>``) to do things. It is recommend you opt for the small hammer commands, because they often tend to be a lot faster.

See the ``make help`` section below for a complete list of commands.

Useful Commands and Summary
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. Note: this document does not contain all commands in Makefile. To see full range of the make interface, please see Makefile

- ``dev.pull.<service>`` - Pull latest Docker images for the service and its dependencies

  When to use: If you have not used Devstack for a while or pulled new images for a while, the installed requirements in your containers might no longer match those used by your code. So it is recommended you pull new images whenever you want your containers to have the latest requirements (python libraries...) installed.

  Note: for new service images to be used, you first need to bring down those services and then bring them back up after a pull.

  Note: Pulling new images will not affect your databases state

  Variations:

  + ``make dev.pull.large-and-slow``, ``make dev.pull``, or ``make pull`` will pull all images in the default devstack.

    When to use: Probably only when you are first setting up devstack. Do not use this often. This will take a lot of time.

  + ``make dev.pull.<service1>+<service2>`` will pull images for <service1>, <service2>, and their dependencies

  + ``make dev.pull.without-deps.<service>`` will only pull <service> image.

    When to use: If you only want to update one image and do not mind if the other images are behind latest.

- ``dev.up.<service>`` - Create and start containers. i.e. brings up the <service> container and its dependencies

  When to use: When you are working on a specific service, use this command to bring up the necessary containers for your service i.e if working in lms, use ``make dev.up.lms`` to bring up containers for lms and its dependencies.

  Especially if you are running devstack after a few days of break, you will likely want to use ``make dev.pull.<service>`` before this using this command.

  Also see below at ``dev.stop`` and ``dev.remove-containers`` for opposite counterparts of this command

  Variations:

  + ``make dev.up.large-and-slow``, ``make dev.up``, or ``make up`` will bring up containers for *everything* in default devstack

    When to use: Probably never, unless you are doing a full devstack level testing

  + ``make dev.up.<service1>+<service2>`` will bring up <service1>, <service2>, and their dependencies

  + ``make dev.up.without-deps.<service>`` will only bring up the <service> container

- ``dev.stop``: Stops all running containers.  This does not remove the containers or the networks they had created

  When to use: When you are pausing your work on devstack and you want to pick back up from where you left off. Next time you use dev.up.<service> to bring up containers, you should be able to mostly pick back up from where you started.

  Variation:
  + ``make dev.stop.<service>`` will only stop the specified container

- ``dev.remove-containers``: stops and removes all running containers as well as any networks that were created. Next time you use dev.up.<service> to bring up containers, your containers have reverted back to the pulled image.

  Note: This will not affect content of the databases.

  When to use: use this command only if you are okay with removing any changes you might have made to your containers. You will likely want to use ``make dev.stop`` instead of ``make dev.remove-containers``.

  Variation:

  + ``make dev.remove-containers.<service>`` will stop and remove only the specified container.

    Note: This will only bring down <service>'s container and not its dependencies.

- ``dev.shell.<service>``: used to enter the shell of the specified service container.

  When to use: To update python packages, to run migrations, or any shell commands you want to run on the running service

  Variation: ``make <service>-shell``

  Tip: To enter either ``mysql`` or ``mongo`` shell, run ``make mysql-shell`` or ``make mongo-shell`` to enter container shell and then run either ``mysql`` or ``mongo`` to enter the database shell

- ``dev.attach.<service>``: dev.up is setup to bring up the service container in the background. This attaches the container to your shell.

  When to use: If you put a breakpoint somewhere in your code, the pdb shell will show up in here.

  Tip: use ``Ctrl+c`` to restart the devserver

  Tip: use ``Ctrl+p Ctrl+q`` to detach without closing your terminal

  Variation: ``make <service>-attach``

- ``dev.logs.<service>``: View the logs of the specified service <service>

  When to use: during debugging, this would help you see live logs coming out of your container.

  Variation: ``make dev.logs`` to view logs for all running containers. Do not use this! This is likely very overwhelming.

  Variation: ``make <service>-logs``

- ``dev.restart-devserver.<service>`` restarts the Django/Sinatra server inside container without restarting the container itself.

  When to use: When automatic code reloading is not working and you need to manually restart a particular application server.

  Tip: This only works for backend services. To restart frontends, use ``dev.attach.frontend-app-<name>`` and ``Ctrl+C``.

  Variation: ``make <service>-restart-devserver``.

- ``dev.restart-container.<service>`` restarts service container. This is essentially a stronger version of ``dev.restart-devserver``

  Note: this will only restart <container> and not its dependencies

  Variation: ``make dev.restart-container.<service1>+<service2>`` will restart both <service> and <service>

- ``dev.backup`` creates a backup of all the database containers(mysql, elasticsearch, mongo)

  Also see below at ``dev.restore`` for opposite counterpart to this command.

- ``dev.restore`` will restore your database volumes to the backups created using ``dev.backup``

  Warning: This will overwrite your databases. Only use if you want all your database volumes to revert back to the backup.

Make Help
~~~~~~~~~

The following ``make help`` output was generated in 09-2023 to make these commands searchable in documentation.

If you want to ensure you are getting the latest listing, simply use ``make help``.

.. code:: sh

    % make help
    Please use `make <target>' where <target> is one of
      build-courses                Build course and provision cms, and ecommerce with it.
      create-test-course           Provisions cms, and ecommerce with course(s) in test-course.json.
      dev.attach.%                 Attach to the specified service container process for debugging & seeing logs.
      dev.backup                   Write all data volumes to the host.
      dev.cache-programs           Copy programs from Discovery to Memcached for use in LMS.
      dev.check                    Run checks for the default service set.
      dev.check-memory             Check if enough memory has been allocated to Docker.
      dev.checkout                 Check out "openedx-release/$OPENEDX_RELEASE" in each repo if set, use default branch otherwise.
      dev.clone                    Clone service repos to the parent directory.
      dev.clone.https              Clone service repos using HTTPS method to the parent directory.
      dev.clone.ssh                Clone service repos using SSH method to the parent directory.
      dev.dbcopy8.%                Copy data from old mysql 5.7 container into a new 8 db
      dev.dbshell.%                Run a SQL shell on the given database.
      dev.destroy                  Irreversibly remove all devstack-related containers and networks (though not data volumes)
      dev.destroy.coursegraph      Remove all coursegraph data.
      dev.down                     Documentation for a change to naming
      dev.drop-db.%                Irreversably drop the contents of a MySQL database in each mysql container.
      dev.forum.build-indices      Build indices for forum service
      dev.kill                     Kill all running services.
      dev.kill.%                   Kill specific services.
      dev.logs                     View logs from running containers.
      dev.logs.%                   View the logs of the specified service container.
      dev.migrate                  Run migrations for applicable default services.
      dev.migrate.%                Run migrations on a service.
      dev.print-container.%        Get the ID of the running container for a given service.
      dev.provision                Provision dev environment with default services, and then stop them.
      dev.provision.%              Provision specified services.
      dev.prune                    Prune dangling docker images, containers, and networks. Useful when you get the 'no space left on device' error
      dev.ps                       View list of created services and their statuses.
      dev.pull.%                   Pull latest Docker images for services and their dependencies.
      dev.pull.large-and-slow      Pull latest Docker images required by default services.
      dev.pull.without-deps.%      Pull latest Docker images for specific services.
      dev.remove-containers        Stop and remove containers and networks for all services.
      dev.remove-containers.%      Stop and remove containers for specific services.
      dev.reset                    Attempt to reset the local devstack to the default branch working state without destroying data.
      dev.reset-repos              Attempt to reset the local repo checkouts to the default branch working state.
      dev.restart-container        Restart all service containers.
      dev.restart-container.%      Restart specific services' containers.
      dev.restart-devserver.%      Kill an edX service's development server. Watcher should restart it.
      dev.restore                  Restore all data volumes from the host. WILL OVERWRITE ALL EXISTING DATA!
      dev.rm-stopped               Remove stopped containers. Does not affect running containers.
      dev.shell.%                  Run a shell on the specified service's container.
      dev.static.%                 Rebuild static assets for the specified service's container.
      dev.stats                    Get per-container CPU and memory utilization data.
      dev.status                   Prints the status of all git repositories.
      dev.stop                     Stop all running services.
      dev.stop.%                   Stop specific services.
      dev.up.attach.%              Bring up a service and its dependencies + and attach to it.
      dev.up.large-and-slow        Bring up default services.
      dev.up.shell.%               Bring up a service and its dependencies + shell into it.
      dev.up.with-programs         Bring up default services + cache programs in LMS.
      dev.up.with-programs.%       Bring up services and their dependencies + cache programs in LMS.
      dev.up.with-watchers         Bring up default services + asset watcher containers.
      dev.up.with-watchers.%       Bring up services and their dependencies + asset watcher containers.
      dev.up.without-deps.%        Bring up services by themselves.
      dev.up.without-deps.shell.%  Bring up a service by itself + shell into it.
      dev.validate                 Print effective Docker Compose config, validating files in COMPOSE_FILE.
      dev.wait-for.%               Wait for these services to become ready
      devpi-password               Get the root devpi password for the devpi container.
      docs                         generate Sphinx HTML documentation, including API docs
      hadoop-application-logs-%    View hadoop logs by application Id.
      help                         Display this help message.
      impl-dev.clone.https         Clone service repos using HTTPS method to the parent directory.
      impl-dev.clone.ssh           Clone service repos using SSH method to the parent directory.
      impl-dev.provision           Provision dev environment with default services, and then stop them.
      impl-dev.provision.%         Provision specified services.
      impl-dev.pull.%              Pull latest Docker images for services and their dependencies.
      impl-dev.pull.without-deps.% Pull latest Docker images for specific services.
      impl-dev.up.%                Bring up services and their dependencies.
      impl-dev.up.attach.%         Bring up a service and its dependencies + and attach to it.
      impl-dev.up.without-deps.%   Bring up services by themselves.
      metrics-opt-in               To opt into basic data collection to help improve devstack
      metrics-opt-out              To opt out of metrics data collection
      requirements                 install development environment requirements
      selfcheck                    Check that the Makefile is free of Make syntax errors.
      upgrade                      Upgrade requirements with pip-tools.
      validate-lms-volume          Validate that changes to the local workspace are reflected in the LMS container.
      vnc-passwords                Get the VNC passwords for the Chrome and Firefox Selenium containers.
