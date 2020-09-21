devpi in Devstack
=================

Several tasks in Devstack require pulling fresh copies of Python packages
from PyPI. Depending on the application you are working on this can take
anywhere from a few seconds to several minutes. Additionally, those tasks
could not be done while offline due to not being able to contact PyPI.

To help speed up those tasks and bring us close to being able to use
Devstack entirely offline we have introduced a devpi PyPI cache container
to Devstack. Currently it is only configured as a package cache for LMS
and Studio, but the hope is to expand its use to the other Devstack
applications and to move to a state where it comes pre-populated with the
requirements of all Devstack applications.

In general the operation of devpi should be transparent. You may notice
some significant speedup in tox testing and ``paver update_prereqs``
operations after the first run. Container storage should persist through
``make down`` and ``make dev.up`` operations.

The devpi web interface can be browsed from the host at:
http://localhost:3141/

Documentation for devpi is at:
https://www.devpi.net/


What is cached?
---------------

devpi will cache anything that LMS or Studio pull from PyPI via pip,
including things from the various requirements files. It will not cache
requirements given as URLs (ex. ``git+https`` style links) or local
packages (ex. ``-e common/lib/calc``). When these types of packages are
encountered they bypass devpi.

How is it tied into other Devstack components?
----------------------------------------------

devpi runs in a separate container started via the usual ``make``
operations and controlled through Docker Compose. Devstack components
can use the ``devpi_consumer`` role in edx-configuration to add devpi
configuration to their containers, and override configuration
variables as necessary.

``devpi_consumer`` creates a pip.config file in the configured location
that tells pip to use devpi as the primary package repository. If devpi
does not have a requested package it will call through to PyPI and
cache the result if something is found.

Disabling devpi
---------------

To temporarily remove devpi caching from an edxapp container, start a
shell (``lms-shell`` or ``studio-shell``) and move or delete
``/root/.pip/pip.conf``. This will be undone on the next container
restart unless the container state is persisted.

Monitoring devpi
----------------

You can monitor the devpi logs by running this command on the host:
``docker logs -f b2b.devstack.devpi`` or looking at the output in
Kitematic. You can also check the devpi server status by visiting:
http://localhost:3141/+status
