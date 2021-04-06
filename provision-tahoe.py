#!/usr/bin/env python
"""
This file belongs to `appsembler/devstack` repo, only edit that version.
Otherwise your changes will be overridden each time devstack is started.
"""
from path import Path
from os import symlink
from subprocess import call


ENVIRONMENT_FILES = [
    'lms.yml',
    'studio.yml',
]

SRC_DIR = Path('/edx/src/')
ENVS_DIR = SRC_DIR / 'edxapp-envs'
PIP_DIR = SRC_DIR / 'edxapp-pip'
EDXAPP_ETC_DIR = Path('/edx/etc')


def move_environment_files_to_host():
    """
    Move the json environment files to the host so they're editable.
    """
    if not ENVS_DIR.exists():
        raise Exception('Tahoe error: edxapp-envs is not checkout please run "make dev.clone" to correct the issue.')

    for filename in ENVIRONMENT_FILES:
        container_path = EDXAPP_ETC_DIR / filename
        src_path = ENVS_DIR / filename  # The mounted directory in devstack

        if not src_path.exists():
            raise Exception((
                'Unable to correctly locale the edxapp-envs/{file}. Please run "make dev.clone" '
                'to correct the issue then `$ make down` and `$ make dev.up`.'
            ).format(file=src_path))

        if container_path.exists():
            container_path.unlink()
        if not container_path.islink():
            symlink(src_path, container_path)


def install_auto_pip_requirements():
    """
    Install source pip packages (git repositories) that are checked out at `src/edxapp-pip`.

    This useful to avoid the need to re-install pip requirements every time a `$ make dev.up` is done.
    """
    if not PIP_DIR.exists():
        return

    for package_dir in PIP_DIR.dirs():
        setup_file = package_dir / 'setup.py'
        if setup_file.exists():  # Ensure it's a proper Python package.
            call(['pip', 'install', '--no-deps', '-e', package_dir])


def main():
    move_environment_files_to_host()
    install_auto_pip_requirements()


main()
