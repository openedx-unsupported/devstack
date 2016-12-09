# devstack

Get up and running quickly with edX services.

## Getting Started

All of the services can be run by following the steps below.

1. Run the provision command, if you haven't already, to configure the various services with super-users (for
   development without the auth service) and tenants (for multi-tenancy).

   The username and password for the superusers are both "edx". You can access the services directly via Django admin
   at the `/admin` path.

    ```
    $ make devstack.provision
    ```

2. Start the services.

    ```
    $ make devstack.start
    ```

After the services have started, if you need shell access to one of the services, run `make devstack.open.<service>`.

```
$ make devstack.open.discovery
```
