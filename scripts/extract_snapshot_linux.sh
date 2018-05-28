#!/bin/sh

# Installs Open edX devstack on Linux from a local snapshot of repository,
# image, and volume tarballs.

set -e

# Extract all of the Open edX source code repositories needed to run devstack
for tarball in repositories/*.tar.gz
do
    echo "Extracting $tarball"
    tar xzf $tarball
done

# Load Docker containers and their associated volumes
# Calls to "docker" usually require sudo privileges on Linux
sudo python devstack/scripts/restore.py

# For the rest, we need to be in the directory with the devstack Makefile
cd devstack

# Shut down all the running containers, the volumes were incomplete at startup
sudo make down

# Start all the containers again with correctly populated volumes.
sudo make dev.up
