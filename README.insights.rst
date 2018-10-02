Open edX Devstack Insights Devstack
===================================

This a small separate documentation that will probably be integrated in the main README file.

Quick start
-----------

1. Provision the docker images:

    make dev.provision.insight

2. Start insights:

    make dev.up.insights

3. Add edx.devstack.lms edx.devstack.analyticsapi as an alias to your localhost (this will
be useful when authenticating across the LMS)


Once everything is setup you can access the analytics dashboard via the following urls: http://localhost:18110


Additional Notes
----------------

The docker compose file (docker-compose-analytics-pipeline.yml) will need local images to be built
as the edxops images are not setup correctly for the devstack (some parameters are missing).

You might need to build them yourself using the following command:


    docker-compose  -f docker-compose.yml -f docker-compose-host.yml -f docker-compose-insights.yml build insights analyticsapi


For now the analytics API is not connected to the analytics backend so we need to load data before using
the analytics dashboard.


**Note:**

If you decide to run the provisionXXX.sh script by itself, make sure that DEVSTACK_WORKSPACE environment
variable is set and exported in sub-shell. If not some drives might not be mounted correctly, resulting in
a series of VM failures.

