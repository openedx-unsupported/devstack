#!/usr/bin/env bash

if [[ -z "${DEVSTACK_WORKSPACE}" ]]; then
  echo "DEVSTACK_WORKSPACE environment variable undefined. Exiting..."
  exit 1
fi

cd $DEVSTACK_WORKSPACE/devstack/ && make dev.up.lms
cd ../enterprise-catalog/ && make dev.up
cd ../license-manager/ && make dev.up

exit 0
