4. Backend services now depend on frontend apps
-----------------------------------------------

Status
======

**Reverted** due to resource depletion concerns.

A consequence of implementing this decision was that an increased number of containers (specifically, frontend containers) were started by common commands like ``make dev.provision`` and ``make dev.up.lms``. Unfortunately, the increased system resource consumption was leading to blocking workflow disruptions such as Docker network timeouts.

In absence of an immediately obvious way of reducing the additional resource burden that this decision's implementation requires, we have decided to revert it. Future work could include:

* Revisit the *Rejected Alternatives* listed at the bottom of this decision record. Both of those alternatives allow smaller groups of containers to be started for different situtations.
* Investigate how the memory and CPU footprints of the micro-frontend Docker containers could be reduced.
* Investigate running all micro-frontends from a singular Docker container.

Context
=======

Micro-frontends as default experiences
**************************************

As of mid June 2021 (between the Lilac and Maple releases), an Open edX instance with default configuration will now direct users to the Learning MFE (Micro-Frontend) for courseware, with a temporary opt-out flag existing to revert to legacy LMS-rendered frontend. Thus, to test a typical learner experience, Devstack users now require the frontend-app-learning container to be started alongside the LMS. This is in contrast to the previous state of affairs, in which MFE experiences were only available via an opt-IN flag, allowing reasonable Devstack usage without having to start any MFE containers.

We anticipate that other learner, author, and administrator experiences will soon begin to use MFE features by default, requiring that more and more MFEs be started in order to simulate user experiences in Devstack. Thus, we anticipate an imminent developer experience issue, in which developers will need to type in convoluated commands like::

  make dev.up.frontend-app-authn+frontend-app-discussions+frontend-app-gradebook+frontend-app-learning


in order to enable the feature set that was previously available using simply::

  make dev.up.lms


Docker-compose service dependencies
***********************************

Devstack uses docker-compose to orchestrate containers by defining services in ``docker-compose.yml``. Note that "services" here encompasses backends, frontends, and generic resources like MySQL.

Each service definition may indicate a list of depentent services using the ``depends_on`` key. Dependencies are transitive, and may not be cyclical. When a developer runs ``make dev.up.<service>``, docker-compose is invoked in order to start both the service as well as its dependencies. For example, LMS depends on Mongo and Discovery, among other services. So, running ``make dev.up.lms`` will start not just LMS, but also Mongo, Discovery, all of Discovery's dependencies, and so on.

Currently, micro-frontend services (those prefixed with ``frontend-app-``) are defined to depend on backends, but not vice versa. So, starting frontend-app-learning will automatically start LMS, but starting LMS will not automatically start frontend-app-learning. This makes sense under logic that "frontends depend on the APIs of backends in order to function".

However, it can be argued that the opposite dependency relationship also makes sense. That is, one may assert that backends should depend on frontends in order to expose their APIs in a usable way. One could further assert that frontends shouldn't have hard dependencies on backend APIs, and should instead gracefully degrade when some or all of its APIs are unavailable.


Decision
========

Whichever dependency direction (frontends depend on backends, or vice versa) is more logically sound, we conclude that, for the purposes of Devstack, *asserting that backends depend on frontends is more useful to developers*. Specifically, it is beneficial to current and future developer workflows if ``make dev.up.lms`` automatically starts and learning-related frontends, ``make dev.up.cms`` automatically starts all authoring-related frontends, ``make dev.up.ecommerce`` starts all purchasing-related frontends, and so on.

A necessary corollary to this decision is that *all micro-frontends required for default functionality must be included in devstack*. While it is encouraged that *all* new and existing micro-frontends are added to devstack using the pattern described above, it is absolutely necessary that MFEs which are required for out-of-the-box functionality be added to devstack.


Consequences
============

* ``docker-compose.yml`` will be updated to reflect that backend services depend on frontend-app services, not the other way around. Devstack documentation will be upated accordingly.
* ``docker-compose-host.yml`` will be updated to address an issue with local usage of JS packages, which currently forces some frontend development workflows to occur outside of devstack.  The `documentation in frontend-build`_ will be updated accordingly. See `ADR 5`_ for details.
* An email and Slack message will be sent out to explain these changes and how we anticipate that they will impact developer workflows. The email will explain that if a micro-frontend is required to simulate common user story in the default configuration, then that frontend should be devstack, and should be automatically started by the relevant backend using ``depends_on``.


.. _documentation in frontend-build: https://github.com/openedx/frontend-build#local-module-configuration-for-webpack
.. _ADR 5: ./0005-frontend-package-mounts.rst

Rejected Alternatives
=====================

* Keep the old dependency relationships, but add convenience targets (such as ``dev.up.domain.learning``) to start groups of related micro-frontends. We determine that this would increase the already-large congnitive overhead of the Devstack interface.
* Invert dependency relationships as described in this ADR, and also add targets such as ``make dev.up.lms-backend`` in order to start LMS without associated frontends. We determine that this would create a cascade of new inconsistencies in the Devstack interface: since only one of ``lms`` or ``lms-backend`` could exist as a docker-compose service, rules for the other would have to be hard-coded into the Makefile as special cases.
