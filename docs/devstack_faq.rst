Frequently Asked Questions
==========================

.. contents:: Table of Contents
   :local:

How do I define my own local targets?
-------------------------------------

If you'd like to add some convenience make targets, you can add them to a ``local.mk`` file, ignored by git.

How do I make payments?
-----------------------

The ecommerce image comes pre-configured for payments via CyberSource and PayPal. Additionally, the provisioning scripts
add the demo course (``course-v1:edX+DemoX+Demo_Course``) to the ecommerce catalog. You can initiate a checkout by visiting
http://localhost:18130/basket/add/?sku=8CF08E5 or clicking one of the various upgrade links in the LMS. The following
details can be used for checkout. While the name and address fields are required for credit card payments, their values
are not checked in development, so put whatever you want in those fields.

- Card Type: Visa
- Card Number: 4111111111111111
- CVN: 123 (or any three digits)
- Expiry Date: 06/2025 (or any date in the future)

PayPal (same for username and password): devstack@edx.org

How do I develop on an installed Python package?
------------------------------------------------

If you want to modify an installed package – for instance ``edx-enterprise`` or ``completion`` – clone the repository in
``~/workspace/src/your-package``. Next, ssh into the appropriate docker container (``make lms-shell``),
run ``pip install -e /edx/src/your-package``, and restart the service.

How do I upgrade Python packages?
---------------------------------

Unlike the ``node_modules`` directory, the ``virtualenv`` used to run Python
code in a Docker container only exists inside that container.  Changes made to
a container's filesystem are not saved when the container exits, so if you
manually install or upgrade Python packages in a container (via
``pip install``, ``paver install_python_prereqs``, etc.), they will no
longer be present if you restart the container.  (Devstack Docker containers
lose changes made to the filesystem when you reboot your computer, run
``make remove-containers``, restart or upgrade Docker itself, etc.) If you want to ensure
that your new or upgraded packages are present in the container every time it
starts, you have a few options:

* Merge your updated requirements files and wait for a new `edxops Docker image`_
  for that service to be built and uploaded to `Docker Hub`_.  You can
  then download and use the updated image (for example, via ``make dev.pull.<service>``).
  The discovery and edxapp images are built automatically via a Jenkins job. All other
  images are currently built as needed by edX employees, but will soon be built
  automatically on a regular basis. See `building images for devstack`_ for more information.
* You can update your requirements files as appropriate and then build your
  own updated image for the service as described above, tagging it such that
  ``docker compose`` will use it instead of the last image you downloaded.
  (Alternatively, you can temporarily edit ``docker-compose.yml`` to replace
  the ``image`` entry for that service with the ID of your new image.) You
  should be sure to modify the variable override for the version of the
  application code used for building the image. See `How do I build images?`_.
  for more information.
* You can temporarily modify the main service command in
  ``docker-compose.yml`` to first install your new package(s) each time the
  container is started.  For example, the part of the cms command which
  reads ``...&& while true; do...`` could be changed to
  ``...&& pip install my-new-package && while true; do...``.
* In order to work on locally pip-installed repos like edx-ora2, first clone
  them into ``../src`` (relative to this directory). Then, inside your lms shell,
  you can ``pip install -e /edx/src/edx-ora2``. If you want to keep this code
  installed across stop/starts, modify ``docker-compose.yml`` as mentioned
  above.

How do I upgrade Node.js packages?
----------------------------------

JavaScript packages for Node.js are installed into the ``node_modules``
directory of the local git repository checkout which is synced into the
corresponding Docker container.  Hence these can be upgraded via any of the
usual methods for that service (``npm install``,
``paver install_node_prereqs``, etc.), and the changes will persist between
container restarts.

How do I rebuild static assets?
-------------------------------

Optimized static assets are built for all the Open edX services during
provisioning, but you may want to rebuild them for a particular service
after changing some files without re-provisioning the entire devstack.  To
do this, run the ``make dev.static.<service>`` target.  For example:

.. code:: sh

   make dev.static.credentials

To rebuild static assets for all service containers:

.. code:: sh

   make dev.static

How do I enable comprehensive theming?
--------------------------------------

Following directions `Changing Themes for an Open edX Site`_ to get started. You can create your theme inside the ``${DEVSTACK_WORKSPACE}/edx-themes`` local directory as this maps to the Docker container ``/edx/app/edx-themes`` location.

Devstack Envs Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Make sure that you enable the following code in ./edx-platform/lms/envs/devstack.py as this will make sure that you have the appropriate Mako template overrides applied for your theme. Forgetting to enable this will not allow your theme template files to be overriden by the platform. See `discuss 3557 <https://discuss.openedx.org/t/enable-comprehensive-theming-devstack-mako-template-overrides-not-working/3557>`__ for details concerning issues with not enabling the following code.

.. code:: python

   ########################## THEMING  #######################
   # If you want to enable theming in devstack, uncomment this section and add any relevant
   # theme directories to COMPREHENSIVE_THEME_DIRS

   # We have to import the private method here because production.py calls
   # derive_settings('lms.envs.production') which runs _make_mako_template_dirs with
   # the settings from production, which doesn't include these theming settings. Thus,
   # the templating engine is unable to find the themed templates because they don't exist
   # in it's path. Re-calling derive_settings doesn't work because the settings was already
   # changed from a function to a list, and it can't be derived again.

   from .common import _make_mako_template_dirs
   ENABLE_COMPREHENSIVE_THEMING = True
   COMPREHENSIVE_THEME_DIRS = [
       "/edx/app/edxapp/edx-platform/themes/",
       "/edx/app/edx-themes/edx-platform/"
   ]
   TEMPLATES[1]["DIRS"] = _make_mako_template_dirs
   derive_settings(__name__)

How do I connect to the databases from an outside editor?
---------------------------------------------------------

To connect to the databases from an outside editor (such as MySQLWorkbench),
first uncomment these lines from ``docker-compose.yml``'s ``mysql80`` section

.. code:: yaml

  ports:
    - "3506:3306"

Then bring your mysql container down and back up by running:

.. code:: sh

  docker compose stop mysql80
  docker compose up -d mysql80

Then connect using the values below. Note that the username and password will
vary depending on the database. For all of the options, see ``provision.sql``.

- Host: ``localhost``
- Port: ``3506``
- Username: ``edxapp001``
- Password: ``password``

If you have trouble connecting, ensure the port was mapped successfully by
running ``make dev.ps`` and looking for a line like this:
``edx.devstack.mysql80 docker-entrypoint.sh mysql ... Up 0.0.0.0:3506→3306/tcp``.

How do I build the service images myself?
-----------------------------------------

See the instructions for `building images for devstack`_.

How do I create relational database dumps?
------------------------------------------

See the instructions for `updating relational database dumps`_.

How do I keep my database up to date?
-------------------------------------

To run Django migrations for a particular service, bring up the service and use
``make dev.migrate.<service>``. For example:

.. code:: sh

   make dev.up.cms
   make dev.migrate.cms

To run migrations for all services at once, run:

.. code:: sh

   make dev.up.large-and-slow
   make dev.migrate

Alternatively, you can discard and rebuild the entire database for all
devstack services by re-running ``make dev.provision.<service>``.  Note that
if your branch has fallen significantly behind master, it may not include all
of the migrations included in the database dump used by provisioning.  In these
cases, it's usually best to first rebase the branch onto master to
get the missing migrations.

How do I access a database shell?
---------------------------------

To access a MongoDB shell, run the following commands:

.. code:: sh

   make dev.shell.mongo
   mongo

To access the MySQL shell for a particular database, run:

.. code:: sh

   make dev.shell.mysql80
   mysql
   use <database>;

Equivalently, you can use the command ``make dev.dbshell.<database>`` as a shortcut. For example,
this will put you in a MySQL shell using the E-Commerce database:

.. code:: sh

  make dev.dbshell.ecommerce

How do I create new migrations?
-------------------------------

For LMS, log into the LMS shell and run the
``makemigrations`` command with the ``devstack_docker`` settings:

.. code:: sh

   make dev.shell.lms
   ./manage.py lms makemigrations <appname> --settings=devstack_docker

For CMS, it is similar:

.. code:: sh

   make dev.shell.cms
   ./manage.py cms makemigrations <appname> --settings=devstack_docker

Finally, for any other service, run:

.. code:: sh

   make dev.shell.<service>
   ./manage.py makemigrations <appname>

Also, make sure you are aware of the `Django Migration Don'ts`_ as the
edx-platform is deployed using the red-black method.

Switching branches
------------------

You can usually switch branches on a service's repository without adverse
effects on a running container for it.  The service in each container is
using runserver and should automatically reload when any changes are made
to the code on disk.  However, note the points made above regarding
database migrations and package updates.

When switching to a branch which differs greatly from the one you've been
working on (especially if the new branch is more recent), you may wish to
halt and remove the existing containers via ``make remove-containers``, pull the latest Docker
images via ``make dev.pull.<service>``, and then re-run ``make dev.provision.<service>``
in order to recreate up-to-date databases, static assets, etc.

If making a patch to a named release, you should pull and use Docker images
which were tagged for that release.

Changing LMS/CMS settings
----------------------------

LMS and CMS read many configuration settings from the container filesystem
in the following locations:

- ``/edx/etc/lms.yml``
- ``/edx/etc/cms.yml``

Changes to these files will *not* persist over a container restart, as they
are part of the layered container filesystem and not a mounted volume. However, you
may need to change these settings and then have the LMS or CMS pick up the changes.

After changing settings, you can restart the LMS/CMS process without restarting the container by running the following on your host machine:

.. code:: sh

   make dev.restart-devserver.lms     # For LMS
   make dev.restart-devserver.cms  # For CMS


.. _edxops Docker image: https://hub.docker.com/r/edxops/
.. _Docker Hub: https://hub.docker.com/
.. _building images for devstack: docs/building-images.rst
.. _How do I build images?: docs/building-images.rst
.. _Changing Themes for an Open edX Site: https://edx.readthedocs.io/projects/edx-installing-configuring-and-running/en/latest/configuration/changing_appearance/theming/index.html
.. _updating relational database dumps: docs/database-dumps.rst
.. _Django Migration Don'ts: https://engineering.edx.org/django-migration-donts-f4588fd11b64
