
Getting Started on Analytics
----------------------------

Analyticstack can be run by following the steps below.

**NOTE:** Since a Docker-based devstack runs many containers, you should configure
Docker with a sufficient amount of resources. We find that
`configuring Docker for Mac`_ with a minimum of 2 CPUs and 6GB of memory works
well for **analyticstack**. If you intend on running other docker services besides
analyticstack ( e.g. lms, studio etc ) consider setting higher memory.

1. Follow steps `1` and `2` from the `Getting Started`_ section of the main documentation.

2. Before running the provision command, make sure to pull the relevant
   docker images from dockerhub by running the following commands:

   .. code:: sh

       make dev.pull
       make pull.analytics_pipeline

3. Run the provision command to configure the analyticstack.

   .. code:: sh

       make dev.provision.analytics_pipeline

4. Start the analytics service. This command will mount the repositories under the
   DEVSTACK\_WORKSPACE directory.

   **NOTE:** it may take up to 60 seconds for Hadoop services to start.

   .. code:: sh

       make dev.up.analytics_pipeline

5. To access the analytics pipeline shell, run the following command. All analytics
   pipeline job/workflows should be executed after accessing the shell.

   .. code:: sh

     make analytics-pipeline-shell

   - To see logs from containers running in detached mode, you can either use
     "Kitematic" (available from the "Docker for Mac" menu), or by running the
     following command:

      .. code:: sh

        make logs

   - To view the logs of a specific service container run ``make <service>-logs``.
     For example, to access the logs for Hadoop's namenode, you can run:

      .. code:: sh

        make namenode-logs

   - To reset your environment and start provisioning from scratch, you can run:

      .. code:: sh

        make destroy

     **NOTE:** Be warned! This will remove all the containers and volumes
     initiated by this repository and all the data ( in these docker containers )
     will be lost.

   - For information on all the available ``make`` commands, you can run:

      .. code:: sh

        make help

6. For running acceptance tests on docker analyticstack, follow the instructions in the
   `Running analytics acceptance tests in docker`_ guide.
7. For troubleshooting docker analyticstack, follow the instructions in the
   `Troubleshooting docker analyticstack`_ guide.

.. _configuring Docker for Mac: https://docs.docker.com/docker-for-mac/#/advanced
.. _Getting Started: ../README.rst#getting-started
.. _Running analytics acceptance tests in docker: http://edx-analytics-pipeline-reference.readthedocs.io/en/latest/running_acceptance_tests_in_docker.html
.. _Troubleshooting docker analyticstack: http://edx-analytics-pipeline-reference.readthedocs.io/en/latest/troubleshooting_docker_analyticstack.html
