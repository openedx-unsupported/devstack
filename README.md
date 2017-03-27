# edX Devstack [![Build Status](https://travis-ci.org/edx/devstack.svg?branch=master)](https://travis-ci.org/edx/devstack)

Get up and running quickly with edX services.

If you are seeking info on the Vagrant-based devstack, please see
<https://openedx.atlassian.net/wiki/display/OpenOPS/Running+Devstack>.  This
project is meant to replace the traditional Vagrant-based devstack with a
multi-container approach driven by [Docker Compose][]. It is still in the
alpha/beta testing phase. Support for this project is limited at the moment, so
it may take a while to respond to issues.

You should run any Make targets described below on your local machine, _not_
from within a VM.


## Prerequisites

This project was developed and tested using **Docker 1.13+**. If you are using
macOS, please use [Docker for Mac][].  Previous Mac-based tools (e.g.
boot2docker) are not supported.

[Docker for Windows][] may work but has not been tested and is _not supported_.


### Docker Sync

Docker for Mac has known filesystem issues that significantly decrease
performance. In order to mitigate these issues, we use [Docker Sync][] to
synchronize file data from the host machine to the containers.

If you are using macOS, please follow the [Docker Sync installation instructions][]
before provisioning.


## Getting Started

All of the services can be run by following the steps below. Note that since we
are running many containers, you should configure Docker with a sufficient
amount of resources. Our testing found that [configuring Docker for Mac][] with
2 CPUs and 4GB of memory works well.

1.  The Docker Compose file mounts a host volume for each service's executing
    code. The host directory is defaults to be a sibling of this directory. For
    example, if this repo is cloned to `~/workspace/devstack`, host volumes
    will be expected in `~/workspace/course-discovery`,
    `~/workspace/ecommerce`, etc. These repos can be cloned with the command
    below.

    ```sh
    make dev.clone
    ```

    You may customize where the local repositories are found by setting the
    DEVSTACK_WORKSPACE environment variable.

2.  Run the provision command, if you haven't already, to configure the various
    services with superusers (for development without the auth service) and
    tenants (for multi-tenancy).

    The username and password for the superusers are both "edx". You can access
    the services directly via Django admin at the `/admin/` path, or login via
    single sign-on at `/login/`.

    Provision using docker-sync (recommended for macOS users)
    ```sh
    make dev.sync.provision
    ```

    Default (non-macOS users)
    ```sh
    make dev.provision
    ```

3.  Start the services. This command will mount the repositories under the
    DEVSTACK_WORKSPACE directory.

    _Note: it may take up to 60 seconds for the LMS to start_

    Start using docker-sync (recommended for macOS users)
    ```sh
    make dev.sync.up
    ```

    Default (non-macOS users)
    ```sh
    make dev.up
    ```

After the services have started, if you need shell access to one of the
services, run `make <service>-shell`. For example to access the
Catalog/Course Discovery Service, you can run:

```sh
make discovery-shell
```

To reset your environment and start provisioning from scratch, you can run:

```sh
make destroy
```


## Usernames and Passwords

The provisioning script creates a Django superuser for every service.

```
Email: edx@example.com
Username: edx
Password: edx
```

The LMS also includes demo accounts. The passwords for each of these accounts
is `edx`.

| Username | Email                |
| -------- | -------------------- |
| audit    | audit@example.com    |
| honor    | honor@example.com    |
| staff    | staff@example.com    |
| verified | verified@example.com |


## Service URLs

Each service is accessible at `localhost` on a specific port. The table below
provides links to the homepage of each service. Since some services are not
meant to be user-facing, the "homepage" may be the API root.

| Service           | URL                                 |
| ----------------- | ----------------------------------- |
| Credentials       | <http://localhost:18150/api/v2/>    |
| Catalog/Discovery | <http://localhost:18381/api-docs/>  |
| E-Commerce/Otto   | <http://localhost:18130/dashboard/> |
| LMS               | <http://localhost:18000/>           |
| Studio/CMS        | <http://localhost:18010/>           |


## Useful Commands

Sometimes you may need to restart a particular application server. To do so,
simply use the ```docker-compose restart``` command:

```sh
docker-compose restart <service>
```

`<service>` should be replaced with one of the following:

* credentials
* discovery
* ecommerce
* lms
* studio

## Marketing Site

Docker Compose files useful for integrating with the edx.org marketing site are available. This will NOT be useful to
those outside of edX. For details on getting things up and running, see
https://openedx.atlassian.net/wiki/display/ENG/Marketing+Site.

## PyCharm Integration

A number of edX engineers develop using [PyCharm][]. As of version 2017.1, JetBrains
has greatly improved PyCharm's integration with Docker and Docker Compose. Note that Docker integration is only
supported in the Professional edition.

The [vendor documentation][] goes over the necessary steps to add a Docker Compose remote interpreter. When configuring
the interpreter, the remote path should be set to the service's virtual environment:

    /edx/app/<service>/venvs/<service>/bin/python

For example, the path would be the following for the Credentials Service:

    /edx/app/credentials/venvs/credentials/bin/python

After configuring the interpreter, you should setup a [Django Server Run/Debug Configuration][]. Note that there are
some specific values that should be used fro this configuration.

The host should always be set to `0.0.0.0` so that Django accepts requests from external clients (e.g. your Docker
host). The port should be set to the service-specific port from the table above.

### edxapp
This is a hack because we (unfortunately) modified `manage.py`. (We should fix this!!!)

1. Leave host/port blank
2. Additional Options: runserver 0.0.0.0:18000 (or runserver 0.0.0.0:18010)
3. Custom run command: lms (or cms)

# TODO: Fix Cython for debug

## Remaining Work

There is still work to be done before this is ready for full release to the
Open edX community. Here are the major items:

* [ ] Align with or revise [OEP-5][]
* [ ] Finish provisioning all services
* [ ] Load demo data
* [ ] PyCharm debugging
* [x] Merge [devstack settings for edxapp][], and reactivate host volume


[Docker Compose]: https://docs.docker.com/compose/
[Docker Sync installation instructions]: https://github.com/EugenMayer/docker-sync/wiki/1.-Installation
[Docker Sync]: https://github.com/EugenMayer/docker-sync/wiki
[Docker for Mac]: https://docs.docker.com/docker-for-mac/
[Docker for Windows]: https://docs.docker.com/docker-for-windows/
[OEP-5]: http://open-edx-proposals.readthedocs.io/en/latest/oep-0005.html
[Supervisor]: http://supervisord.org/
[configuring Docker for Mac]: https://docs.docker.com/docker-for-mac/#/advanced
[devstack settings for edxapp]: https://github.com/edx/edx-platform/pull/14376
[PyCharm]: https://www.jetbrains.com/pycharm/
[vendor documentation]: https://www.jetbrains.com/help/pycharm/2017.1/configuring-remote-interpreters-via-docker-compose.html
[Django Server Run/Debug Configuration]: https://www.jetbrains.com/help/pycharm/2017.1/run-debug-configuration-django-server.html
