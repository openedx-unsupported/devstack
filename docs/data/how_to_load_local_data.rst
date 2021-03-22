How to load local data
======================

Currently there are many ways to load data into your local devstack:
- provisioning scripts
- using load_data management commands in each of the services
- do it manually through either mysql, interactiving with website, or other management commands




load_data management command
----------------------------

You can use the `dev.load_test_data` make command to create local data.

To load data, you need to:
- TODO: add directions. This has not yet been fully worked out.

Supported Data
~~~~~~~~~~~~~~

Below is the list of data you can create using this system:

- lms
  + User
  + CourseEnrollment
- ecommerce

How do add more data models to supported data?
______________________________________________

Each of the IDAs have a management command called load_data. The management command `load_data` uses various data creation functions to create the data specified in a yaml file. To support more data models, you need to add a new data creation function to load_data management command and modify the `handle` funtion to call on your new data creation function if the yaml file has spec for your new data model.
