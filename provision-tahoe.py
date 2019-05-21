#!/usr/bin/env python
"""
This file belongs to `appsembler/devstack` repo, only edit that version.
Otherwise your changes will be overridden each time devstack is started.
"""
from os import makedirs
from shutil import move
from path import Path
from os import symlink


ENVIRONMENT_FILES = [
    'lms.env.json',
    'lms.auth.json',
    'cms.env.json',
    'cms.auth.json',
]

SRC_DIR = Path('/edx/src/')
ENVS_DIR = SRC_DIR / 'edxapp-envs'
EDXAPP_DIR = Path('/edx/app/edxapp')


def move_environment_files_to_host():
    """
    Move the json environment files to the host so they're editable.
    """
    for filename in ENVIRONMENT_FILES:
        container_path = EDXAPP_DIR / filename
        src_path = ENVS_DIR / filename  # The mounted directory in

        if not src_path.exists():
            if container_path.islink():
                raise Exception(
                    'Unable to correctly move the environmet files, please shut down the '
                    'container `$ make down` and try again with `$ make tahoe.up`'
                )

            move(container_path, src_path)

        if src_path.exists():
            if container_path.exists():
                container_path.unlink()

            symlink(src_path, container_path)


def main():
    if not ENVS_DIR.exists():
        makedirs(ENVS_DIR)

    move_environment_files_to_host()


main()
