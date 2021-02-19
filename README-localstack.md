# Using Localstack as an S3 stand-in for testing

Localstack is an AWS service stand-in for local development and testing.

## Quick start

Start the `localstack` container:
- Pull this branch
- Run `make dev.up` which should bring up the `localstack` container

Localstack mapping (see ORA Config for examples):
- Edit endpoints to point to localstack locations 
- Add a HOSTS file entry if aliases in Docker need to match those in the browser

## ORA File Upload Config

### Part 1 - service mapping

For testing with ORA, add the following to `edx-platform/lms/envs/private.py`

```
# ORA - Localstack
ORA2_FILEUPLOAD_BACKEND = 's3'
FILE_UPLOAD_STORAGE_BUCKET_NAME = 'ora2'
AWS_ACCESS_KEY_ID = 'test'
AWS_SECRET_ACCESS_KEY = 'test'
AWS_S3_ENDPOINT_URL = 'http://edx.devstack.localstack:4566'
```

This tells ORA to use localstack and points it to the localstack container in Docker (aliased to `eddx.devstack.localstack`).
It also points to the `ora2` bucket which is created when `localstack` starts up.
The AWS credentials should be left alone, they are specified by the `localstack` image for accessing services.

## Part 2 - HOSTs mapping

ORA downloads work by requesting a signed URL accessible form the browser which must match the Docker alias. 
To allow that alias to be accessible from the browser, add the following lines to your HOSTS file (in MacOS this is `private/etc/hosts`)

```
127.0.0.1 edx.devstack.localstack
```

You're all set! Get testing on ORA!
