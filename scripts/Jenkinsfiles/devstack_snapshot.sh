#!/bin/bash

virtualenv --python=python3.8 devstack_snapshot_venv -q
source devstack_snapshot_venv/bin/activate

python scripts/snapshot.py ../devstack_snapshot
