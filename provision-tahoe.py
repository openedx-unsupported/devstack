#!/usr/bin/env python
"""
This file belongs to `appsembler/devstack` repo, only edit that version.
Otherwise your changes will be overridden each time devstack is started.
"""
from path import Path
from subprocess import call


SRC_DIR = Path('/edx/src/')
PIP_DIR = SRC_DIR / 'edxapp-pip'


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
    install_auto_pip_requirements()


main()
