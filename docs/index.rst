Open edX Devstack
#################

Devstack is the local Docker-based environment for developing in the Open edX platform.

The Devstack runs as multiple containers with `Docker Compose`_ at its core.

A Devstack installation includes the following Open edX components by default:

* The Learning Management System (LMS)
* The Learning micro-frontend (A.K.A the new Courseware experience)
* Open Response Assessments (ORA2), among other LMS plug-ins.
* Open edX Studio
* Discussion Forums
* E-Commerce
* Credentials
* Notes
* Course Discovery
* Open edX Search
* A demonstration Open edX course
* The Publisher and Gradebook micro-frontends

It also includes the following extra components:

* XQueue
* The Program Console micro-frontend
* The Library Authoring micro-frontend
* edX Registrar service.
* The course-authoring micro-frontend
* The enhanced staff grader (ora-grading) micro-frontend

  .. _Docker Compose: https://docs.docker.com/compose/

Contents
********

.. toctree::
   :maxdepth: 2

   getting_started
   logging_in
   workflow
   service_list
   devstack_interface
   devstack_faq
   building-images
   database-dumps
   devpi
   developing_on_named_release_branches
   pycharm_integration
   testing_and_debugging
   troubleshoot_general_tips
   advanced_configuration

Indices and tables
******************

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
