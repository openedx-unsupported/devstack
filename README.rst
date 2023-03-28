Open edX Devstack |Build Status provisioning| |Build Status CLI| |docs|
=======================================================================

Devstack is the local Docker-based environment for developing in the Open edX
platform.  Use it to get up and running quickly with Open edX services.

Documentation is on `Read the Docs`_.  Code repository is on `GitHub`_.

.. _Read the Docs: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/
.. _GitHub: https://github.com/openedx/devstack

.. contents:: **Table of Contents:**

Where to Find Help
------------------

There are a number of places to get help, including mailing lists and real-time chat. Please choose an appropriate venue for your question. This helps ensure that you get good prompt advice, and keeps discussion focused. For details of your options, see the `Community`_ pages.

- See the `most common development workflow`_ (after you've finished `Getting Started`_).
- See the `Devstack Interface`_
- See some `helpful troubleshooting tips`_.
- See the `Frequently Asked Questions`_.
- Or learn about `testing and debugging your code in devstack`_.
- If you get confused about any of the terms used in these docs, see `edX Glossary`_

You can also browse all the documentation in `Read the Docs`_.

.. _most common development workflow: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/workflow.html
.. _Devstack Interface: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/devstack_interface.html
.. _helpful troubleshooting tips: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/troubleshoot_general_tips.html
.. _Frequently Asked Questions: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/devstack_faq.html
.. _testing and debugging your code in devstack:
.. _testing_and_debugging.rst: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/testing_and_debugging.html
.. _edX Glossary: https://openedx.atlassian.net/wiki/spaces/AC/pages/28967341/edX+Glossary

.. _Read the Docs: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/

Notices
-------

**NOTE:** LMS is now using MySql 5.7 by default. You have to run ``make dev.pull.lms`` and ``make dev.provision.lms`` (more details in `Getting Started`_) to fetch latest images and reprovision local copies of databases in order for an existing devstack setup to keep working.

.. _Docker Compose: https://docs.docker.com/compose/
.. _Docker for Mac: https://docs.docker.com/docker-for-mac/
.. _licensing terms: https://www.docker.com/pricing/faq
.. _Docker for Windows: https://docs.docker.com/docker-for-windows/
.. _configuring Docker for Mac: https://docs.docker.com/docker-for-mac/#/advanced
.. _feature added in Docker 17.05: https://github.com/openedx/configuration/pull/3864
.. _edx-e2e-tests README: https://github.com/edx/edx-e2e-tests/#how-to-run-lms-and-studio-tests
.. _edxops Docker image: https://hub.docker.com/r/edxops/
.. _Docker Hub: https://hub.docker.com/
.. _devpi documentation: docs/devpi.rst
.. _edx-platform testing documentation: https://github.com/openedx/edx-platform/blob/master/docs/guides/testing/testing.rst#running-python-unit-tests
.. |Build Status provisioning| image:: https://github.com/openedx/devstack/actions/workflows/provisioning-tests.yml/badge.svg?branch=master
    :target: https://github.com/openedx/devstack/actions/workflows/provisioning-tests.yml
    :alt: Provisioning tests
.. |Build Status CLI| image:: https://github.com/openedx/devstack/actions/workflows/cli-tests.yml/badge.svg?branch=master
    :target: https://github.com/openedx/devstack/actions/workflows/cli-tests.yml
    :alt: CLI tests
.. |docs| image:: https://readthedocs.org/projects/docs/badge/?version=latest
    :alt: Documentation Status
    :scale: 100%
    :target: https://edx.readthedocs.io/projects/open-edx-devstack/en/latest/
.. _Python virtualenv: https://docs.python-guide.org/en/latest/dev/virtualenvs/#lower-level-virtualenv
.. _Community: https://open.edx.org/community/connect/
