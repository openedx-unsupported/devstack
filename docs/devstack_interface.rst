Devstack Interface
------------------

Devstack comes built in with many useful make commands that act as an user interface. This UI is essentially a make wrapper around docker-compose commands. We attempt to give a short summary of what the make commands do below, but it would be a good idea for you to familiarize yourself with some knowledge of docker-compose.

Due to the organic nature of how this user interface came into being, there are often multiple ways to do the same thing. The two main variants of commands are of the form: ``dev.ACTION.SERVICE`` vs ``SERVICE-ACTION``. The ``SERVICE-ACTION`` variant tends to be more automatic command-completion friendly.

Examples:

.. code:: sh

    make dev.up.registrar
    make registrar-up

    make dev.shell.lms
    make lms-shell

    make dev.logs.gradebook
    make gradebook-logs

The user interface for devstack often also gives you both big hammers(``make dev.pull``) and small hammers(``make dev.pull.<service>``) to do things. It is recommend you opt for the small hammer commands, because they often tend to be alot faster.

Useful Commands and Summary
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. Note: this document does not contain all commands in Makefile. To see full range of the make interface, please see Makefile

- ``dev.pull.<service>`` - Pull latest Docker images for the service and its dependencies

  When to use: When you want to start working with a service (testing out changes, running unit tests, etc.) and want the latest built image since it has been a few days since you last worked with it. Particularly useful when the Python requirements files have changed recently.

  Variations:

  + ``make dev.pull`` or ``make pull`` will pull all images in the default devstack.

    When to use: Probably only when you are first setting up devstack. Do not use this often. This will take a lot of time.

  + ``make dev.pull.<service1>+<service2>`` will pull images for <service1>, <service2>, and their dependencies

  + ``make dev.pull.without-deps.<service>`` will only pull <service> image.

    When to use: If you only want to update one image and do not mind if the other images are behind latest.

- ``dev.up.<service>`` - Create and start containers. i.e. brings up the <service> container and its dependencies

  When you are working on a specific service, it is recommended you use this command to bring up the necessary containers for your service i.e if working in lms, use ``make dev.up.lms`` to bring up containers for lms and its dependencies.

  Variations:

  + ``make dev.up`` or ``make up`` will bring up containers for *everything* in default devstack

  + ``make dev.up.<service1>+<service2>`` will bring up <service1>, <service2>, and their dependencies

  + ``make dev.up.without-deps.<service>`` will only bring up the <service> container

- ``dev.stop.<container>``: only stops the container. This does not remove the container or the networks it has created

  When to use: When you are pausing your work on this container/devstack and you want to pick back up from where you left off. Next time you use dev.up to bring up containers, you should be able to mostly pick back up from where you started.  TODO(reviewer): Is this true in your experience.

- dev.down.<container>: stops the specified container and also removes the stopped containers as well as any networks that were created. Next time you use dev.up to bring up container, your container have reverted back to the pulled image.  This will not affect content of the databases.

  When to use: use this command only if you are okay with removing any changes you might have made to the container

  Variation: ``make dev.down`` will stop all your containers

- ``dev.shell.<container>``: used to enter the shell of the specified container.

  When to use: To update python packages, to run migrations, or any shell commands you want to run on the running service

  Variation: ``make <service>-shell``

- ``dev.attach.<container>``: dev.up is setup to bring up the container/service in the background. This attaches the container to your shell.

  When to use: If you put a breakpoint somewhere in your code, the pdb shell will show up in here. TODO(reviewer): help with words to explain this use case.

  Variation: ``make <service>-shell``

- ``dev.logs.<container>``: View the logs of the specified service <container>

  When to use: during debugging, this would help you see live logs coming out of your container.

  Variation: ``make dev.logs`` to view logs for all running containers. Do not use this! This is likely very overwhelming.

  Variation: ``make <container>-logs``

- ``dev.restart-container.<container>`` restarts container. TODO(jinder): change any references to this in documentation
  Note: this will only restart <container> and not its dependencies
  When to use: TODO(reviewer): help

  Variation: ``make dev.restart-container.<container1>+<container2>`` will restart both <container1> and <container2>

- ``dev.restart-devserver.<service>`` restarts the Django/Sinatra server inside container without restarting the container itself.

  When to use: When automatic code reloading is not working and you need to manually restart a particular application server.
