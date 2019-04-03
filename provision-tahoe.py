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


def update_tahoe_env_with_tahoe_prefs(filename):
    """
    Apply a couple of patches to the lms/cms.env.json files to match Tahoe needs.

    TODO: Move inside the Docker images, via Ansible.
    """
    env_file_path = ENVS_DIR / filename
    with open(env_file_path, 'r') as env_fd:
        env_object = json.load(env_fd, encoding='utf-8')

        # Theme is enabled by default, can be disabled from within the lms.env.json file
        env_object.update({
            'COMPREHENSIVE_THEME_DIRS': ['/edx/src/themes'],
            'DEFAULT_SITE_THEME': 'edx-theme-codebase',
            'ENABLE_COMPREHENSIVE_THEMING': True,
        })

        env_object['REGISTRATION_EXTRA_FIELDS'] = {
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
        env_object['FEATURES'].update({
            'ENABLE_TIERS_APP': False,  # TODO: Fix the tiers app in devstack
            'ENABLE_CREATOR_GROUP': True,
            'DISABLE_COURSE_CREATION': False,
        })

        lms_env_encoded = json.dumps(env_object, ensure_ascii=False, indent=4).encode('utf-8')

    with open(env_file_path, 'w') as env_fd:
        env_fd.write(lms_env_encoded)


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

        if newly_copied and filename.endswith('.env.json'):
            update_tahoe_env_with_tahoe_prefs(filename)


def main():
    if not ENVS_DIR.exists():
        makedirs(ENVS_DIR)

    move_environment_files_to_host()


main()
