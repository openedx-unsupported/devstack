Development Fixtures
====================

To develop locally, it is often necessary to have specific data in your databases. To make it easier for you to have custom local database, devstack comes built-in with Development Fixtures. Development Fixtures are python functions that modify data in your local databases. They take advantage of the FactoryBoy library to create data in your database based on minimumal specification.

What you can do with this
-------------------------

- modify supported data in one service
- modify supported data in multiple services
- For cross-service data coupling, you can specify the order by which services' databases are modified
  + For example, if ``ecommerce`` needs some data to already exist in ``lms``, you can create that data in ``lms`` first and then create data in ``ecommerce``.

How to Use
----------

You specify your custom local database through two layers of yaml files. The top layer yaml file contains a list, where each object specifies an ``ida_name`` and ``data_spec_path``. The field ``data_spec_path`` points to the bottom layer yaml files, which contain data specification for their respective ``ida_name`` services. The order in which the different services are listed in top layer yaml file is the order in which those services's databases are modified.

Once you are done specifying your database in the yaml files, you can pass the path to the top layer yaml file to ``dev.load_data`` make command. Example: ``make dev.load_data data_spec_top_path=test_data/data_spec_top.yaml``

Steps in list:

- Create a yaml file for each service whose database you want to modify(second layer yaml files)
- Create a yaml file which points to each of the yaml files in the second layer
- run ``make dev.load_data data_spec_top_path=<path>`` from devstack repo

Example top layer Yaml file:

.. code-block:: Yaml

    - ida_name: lms
      data_spec_path: openedx/core/djangoapps/util/management/commands/test_command.yaml
    - ida_name: ecommerce
      data_spec_path: ecommerce/core/management/commands/test_data.yaml
    - ida_name: lms
      data_spec_path: openedx/core/djangoapps/util/management/commands/test_command.yaml

Example of bottom layer Yaml file:

.. code-block:: Yaml

   users:
    - username: verified
        email: verified@example.com
    - username: robot1
        email: robot1@example.com
  enrollments:
    - username: verified
        course_id: 'course-v1:edX+DemoX+Demo_Course'
        mode: verified
    - username: robot1
        course_id: 'course-v1:edX+DemoX+Demo_Course'
        mode: verified


How it works
------------

Each of the services(IDAs) have a management command called ``load_data``. Using the --data-file-path flag, you can pass it a path to a yaml file containing your specificatons for your desired database. The management command takes the specifications from the yaml file and call the appropriate Development Fixtures for each datum.

The ``dev.load_data`` make target takes the ``ida_name`` and ``data_spec_path`` from top layer yaml file and calls the ``load_data`` management command in <ida_name>'s container.


Supported Data
--------------

Below is the list of data you can create using this system:

- lms
  + User
  + CourseEnrollment
- ecommerce


How to add more data models
~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Create a python funtion that takes in a dict with minimal specifications.
#. Modify ``load_data.handler()`` function to call your python function if the yaml specifies your data model
