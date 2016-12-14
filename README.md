# devstack

Get up and running quickly with edX services.

This project is meant to replace the traditional Vagrant VM "devstack" with a multi-container approach driven by Docker Compose. You should run any Make targets described below on your local machine, not from within a VM.

## Getting Started

All of the services can be run by following the steps below. Note that since we are running many containers, you should
configure Docker with a sufficient amount of resources. Our testing found that [configuring Docker for Mac](https://docs.docker.com/docker-for-mac/#/advanced)
 with 2 CPUs and 4GB of memory works well.

1. The Docker Compose file mounts a host volume for each service's executing code. The host directory is expected to be
   a sibling of this directory. For example, if this repo is cloned to `~/workspace/devstack`, host volumes will be
   expected in `~/workspace/course-discovery`, `~/workspace/ecommerce`, etc. These repos can be cloned with the command
   below.

   ```
   $ make clone
   ```

2. Run the provision command, if you haven't already, to configure the various services with super-users (for
   development without the auth service) and tenants (for multi-tenancy).

   The username and password for the superusers are both "edx". You can access the services directly via Django admin
   at the `/admin` path.

    ```
    $ make devstack.provision
    ```

3. Start the services.

    ```
    $ make devstack.start
    ```

After the services have started, if you need shell access to one of the services, run `make devstack.open.<service>`.

```
$ make devstack.open.discovery
```
