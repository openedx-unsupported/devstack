# Support for Provisioning Programs

This directory holds a few scripts that set up a demo program.

Currently, the demo program is very simple, just one demo course and no purchase-bundling support enabled.

Normally you don't need to manually run these scripts to provision the demo course, as it is automatically added when provisioning fresh devstacks.

## Reprovisioning

If you have an existing older devstack installation and want to add the demo program to it, simply run:

    ./programs/provision.sh

And it will set it up for you. This can be run mutiple times safely.

## Recaching

If you have an existing devstack with the demo program, but want to recache the programs inside LMS (something you need to do every time you bring the LMS container back up), simply run:

    make dev.cache-programs

To do this while launching a service, run:

    make dev.up.with-programs.<service>

To make this the default behavior for `dev.up.*`, add the following to `options.local.mk`, creating the file if it does not yet exist:

	ALWAYS_CACHE_PROGRAMS=true
