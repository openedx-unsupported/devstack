5. Mounting frontend packages from src directory
------------------------------------------------

Synopsis
========

``${DEVSTACK_WORKSPACE}/src`` will be mounted at ``/edx/app/src`` within frontend containers, allowing locally-modified NPM packages to be tested via devstack. This will result in workflow changes for some frontend developers, which we will communicate via email.

Status
======

Approved


Context
=======

Current SOA: Local packages for backend services
************************************************

Backend devstack services currently mount the host folder ``${DEVSTACK_WORKSPACE}/src`` into their respective Docker containers at ``/edx/src``, making the contents of ``src`` available within the container. This enables developers to install local versions of Python packages into backend devstack services, as long as the package is placed within the host ``src`` folder. As a concrete user story:

* A dev runs their devstack with ``~`` (home folder) as their ``${DEVSTACK_WORKSPACE}``.
* They would like to run edx-platform with a modified version of the ``completion`` Python package.
* So, they place their modified ``completion`` repository in ``~/src``.
* The dev's modified ``completion`` repository is now available to backend containers at ``/edx/src/completion``.
* Within ``make lms-shell``, they can now run ``pip install -e /edx/src/completion`` in order to install the modified package.

This workflow is made possible via the ``${DEVSTACK_WORKSPACE}/src:/edx/src:cached`` volume declarations for each service that exist in docker-compose-host.yml. This line simply tells docker-compose to mount the ``src`` directory within the host devstack workspace to the ``/edx/src`` directory within a service's Docker container.


Current SOA: Local packages for frontends
*****************************************

Unfortunately, this flow is currently *not* an option for frontend services (i.e., micro-frontends) when they're run via devstack. This was probably not an intentional omission; frontend services were added to devstack in a somewhat ad-hoc way, and the local-package workflow was probably overlooked.

There is, however, an established strategy for using local packages when running frontends *outside* of devstack. This stategy is described in the `frontend-build documentation <https://github.com/openedx/frontend-build#local-module-configuration-for-webpack>`_. Essentially, frontend package respositories can be placed anywhere in the host system, and each frontend's ``module.config.js`` can be pointed at those local respositories using a path relative to the frontend itself. For example:

* A frontend dev has ``frontend-app-profile`` within their home folder (``~``).
* They would like to run a modified version of Paragon, located at ``~/paragon``.
* They create a ``module.config.js``, as recommended by the frontend-build docs, specifying ``../paragon`` as the path.
* They can now ``npm run build`` Paragon, and then install and start ``frontend-app-profile``, which will use their modified Paragon repository.


The issue: Making the frontend strategy work with devstack
**********************************************************

With the acceptance of `ADR 4: Backend services now depend on frontend apps <./0004-backends-depend-on-frontends.rst>`_, it is more important than ever that devstack has a local package workflow for frontends.

Unfortunately, the current backend and frontend strategies are incompatible in two ways:

* The current frontend strategy allows package repositories to be placed anywhere in the filesystem, with the docs recommending them to be siblings of the ``frontend-app-...`` repositories. The backend strategy, on the other hand, requires packages to be placed within ``${DEVSTACK_WORKSPACE}/src``.
* The frontend strategy occurs entirely within the host system; directory mounting is not required. In the backend strategy, though, packages get mounted at ``/edx/src``.

The implication of this is that local frontend package strategy for devstack will have to either:

#. be slightly different than the current non-devstack local frontend package strategy, or
#. be implemented differently than devstack's current local backend package strategy.


Decision
========

We will introduce a local frontend package strategy to devstack that is (a) as similar in mechanism as possible to devstack's local backend package strategy, while (b) differing just enough to make it compatible with non-devstack frontend development. See **Consequences** for specifics.

This is in observance of the `worse-is-better <https://www.jwz.org/doc/worse-is-better.html>`_ design philosophy, which prioritizes simplicity of implementation over simplicity of interface. We hope that maintaining consistency with devstack's local package strategy will be worth the short-term frontend workflow confusion that this change may cause.


Consequences
============

In docker-compose-host.yml, each frontend service will be given a new volume declaration::

  services:

    ...

    frontend-app-XX:
      volumes:
        - ${DEVSTACK_WORKSPACE}/frontend-app-XX:/edx/app/frontend-app-XX:cached
        - frontend_app_XX_node_modules:/edx/app/frontend-app-XX/node_modules
        - ${DEVSTACK_WORKSPACE}/src:/edx/app/src:cached  # <--- This line is new!

This will cause the ``${DEVSTACK_WORKSPACE}/src`` folder to mounted at ``/edx/app/src`` of each frontend service, similar to how that folder is mounted at ``/edx/src`` of each backend service. Via ``module.config.js``, frontend developers will then be able to specify ``../src/PACKAGE`` as the path of any local frontend package. This scheme has the benefit of:

* working within a frontend Devstack container, since ``../src/PACKAGE`` resolves to ``/edx/app/src/PACKAGE``, and
* working oustide of Devstack, since ``../src/PACKAGE`` points to ``PACKAGE`` when ``src`` is a sibling of the frontend application repository.

Developers will be informed of this scheme via a frontend-build documentation update and an email.


Rejected alternatives
=====================


Mount frontend packages at ``/edx/src``
***************************************

One alternative would be to mount packages at ``/edx/src`` within frontend containers instead of ``/edx/app/src``. This approach would have been maximally consistent with the existing local backend package strategy. However, it would make it impossible for frontend developers to maintain a single ``module.config.js`` for both with-devstack and sans-devstack development.

Concretely: Within a devstack container, in order to reference, say, ``/edx/src/paragon`` from an app running within ``/edx/app/frontend-app-profile``, one would need to specify the path ``../../src/paragon`` within ``module.config.js``. In order to reference the same package *outside* of devstack, the proper path would be ``../src/paragon`` (recall that ``src`` and ``frontend-app-profile`` are expected to be sibling directories, both within the devstack workspace).


Explicit frontend mounts in devstack workspace
**********************************************

A more radical alternative would be to explicitly mount certain local frontend packages from the devstack workspace into each frontend container. For example, ``${DEVSTACK_WORKSPACE}/frontend-platform`` would be mounted into every frontend container (if it existed) at ``/edx/app/frontend-platform``. This would be done for a handful of other commonly-developed frontend packages, including Paragon and the branding packages.

This approach would have been the most compatible with the existing local frontend package strategy, but it would sharply differ from devstack's backend package strategy.

For reference, here is a draft implementation of this rejected approach: https://github.com/openedx/devstack/pull/795.
