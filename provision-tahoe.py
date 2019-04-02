#!/usr/bin/env python
"""
This file belongs to `appsembler/devstack` repo, only edit that version.
Otherwise your changes will be overridden each time devstack is started.
"""
from os import makedirs, unlink
from shutil import move
from path import Path
from os import symlink
import json


ENVIRONMENT_FILES = [
    'lms.env.json',
    'lms.auth.json',
    'cms.env.json',
    'cms.auth.json',
]

SRC_DIR = Path('/edx/src/')
ENVS_DIR = SRC_DIR / 'edxapp-envs'
EDXAPP_DIR = Path('/edx/app/edxapp')


def update_lms_env_with_tahoe_prefs():
    """
    Apply a couple of patches to the lms.env.json files to match Tahoe needs.

    TODO: Move inside the Docker images, via Ansible.
    """
    lms_env_file = ENVS_DIR / 'lms.env.json'
    with open(lms_env_file, 'r') as lms_env_fd:
        lms_env = json.load(lms_env_fd, encoding='utf-8')

        # Theme is enabled by default, can be disabled from within the lms.env.json file
        lms_env.update({
            'COMPREHENSIVE_THEME_DIRS': ['/edx/src/themes'],
            'DEFAULT_SITE_THEME': 'edx-theme-codebase',
            'ENABLE_COMPREHENSIVE_THEMING': True,
        })

        lms_env['REGISTRATION_EXTRA_FIELDS'] = {
            'city': 'hidden',
            'country': 'hidden',
            'gender': 'optional',
            'goals': 'optional',
            'honor_code': 'required',
            'level_of_education': 'optional',
            'mailing_address': 'optional',
            'year_of_birth': 'optional',
        }

        # Disable by default. Can be enabled from within the lms.env.json file
        lms_env['FEATURES'].update({
            'ENABLE_TIERS_APP': False,  # TODO: Fix the tiers app in devstack
            'ENABLE_CREATOR_GROUP': True,
            'DISABLE_COURSE_CREATION': False,
        })

        lms_env_encoded = json.dumps(lms_env, ensure_ascii=False, indent=4).encode('utf-8')

    with open(lms_env_file, 'w') as lms_env_fd:
        lms_env_fd.write(lms_env_encoded)


def move_environment_files_to_host():
    """
    Move the json environment files to the host so they're editable.
    """
    for filename in ENVIRONMENT_FILES:
        container_path = EDXAPP_DIR / filename
        src_path = ENVS_DIR / filename  # The mounted directory in

        newly_copied = False
        if not src_path.exists():
            if container_path.islink():
                raise Exception(
                    'Unable to correctly move the environmet files, please shut down the '
                    'container `$ make down` and try again with `$ make tahoe.up`'
                )

            move(container_path, src_path)
            newly_copied = True

        if src_path.exists():
            if container_path.exists():
                container_path.unlink()

            symlink(src_path, container_path)

        if newly_copied and filename == 'lms.env.json':
            update_lms_env_with_tahoe_prefs()


def main():
    if not ENVS_DIR.exists():
        makedirs(ENVS_DIR)

    move_environment_files_to_host()


main()
