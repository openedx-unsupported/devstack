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

## Loopback Alias

Containers making requests to the LMS and Studio must communicate with ports exposed on the host system by the Vagrant VM.

This is fine on Linux, but doesn't work out of the box on OS X. Attempting to access localhost on a container will result
in talking to the Docker for Mac HyperKit VM, not the host machine.

While it's true that you can get this to work by accessing your Mac's external IP from your containers, this isn't ideal because
it won't work if you have no network access on your host. Your external IP also changes as you switch networks, meaning you'd have
to change the IP accessed by your containers every time you changed networks.

A better solution, borrowed from the [Docker forums](https://forums.docker.com/t/access-host-not-vm-from-inside-container/11747/10),
is to give your host a fixed address by creating a [loopback](http://askubuntu.com/questions/247625/what-is-the-loopback-device-and-how-do-i-use-it)
alias. This is done for you by the `devstack.start` target.

The result is a fixed IP which your containers can use to access ports on your host machine. Note that the underlying script uses `sudo`;
adding IP addresses requires root access. Also note that the alias will not survive a host reboot, which is why the `devstack.start` target
always attempts to set up the loopback for you.

Part of the loopback alias setup includes adding a line to the `/etc/hosts` file on your machine. If you want to stop using devstack, you can clean this up by opening your `/etc/hosts` file and removing this line:

```
10.254.254.254 docker.host
```
