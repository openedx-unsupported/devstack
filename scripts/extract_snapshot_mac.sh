#!/bin/sh

# Installs Open edX devstack on macOS from a local snapshot of repository,
# image, and volume tarballs.

set -e

# Extract all of the Open edX source code repositories needed to run devstack
for tarball in repositories/*.tar.gz
do
    echo "Extracting $tarball"
    tar xzf $tarball
done

# Load Docker containers and populate their associated volumes
python devstack/scripts/restore.py

# For the rest, we need to be in the directory with the devstack Makefile
cd devstack

# Shut down all the running containers, the volumes were incomplete at startup
make down

# Start all the containers again with correctly populated volumes.
make dev.up
