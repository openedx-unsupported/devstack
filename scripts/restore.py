#!/usr/bin/env python
"""
Restore Docker images and volumes from the tarballs found in "images" and
"volumes" subdirectories of the current directory.
"""
from __future__ import absolute_import, print_function, unicode_literals

import json
import os
from subprocess import check_call

SOURCE_DIR = os.getcwd()
IMAGES_DIR = os.path.join(SOURCE_DIR, 'images')
VOLUMES_DIR = os.path.join(SOURCE_DIR, 'volumes')
VOLUMES_JSON = os.path.join(VOLUMES_DIR, 'volumes.json')
DEVSTACK_REPO_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Use this minimal container image to restore volume content
BACKUP_IMAGE = 'alpine:latest'


def load_images():
    """
    Load all of the Docker images from the associated tarballs.
    """
    for filename in os.listdir(IMAGES_DIR):
        if not filename.endswith('.tar.gz'):
            continue
        tarball = os.path.join(IMAGES_DIR, filename)
        print('Loading Docker image from {}'.format(filename))
        check_call(['docker', 'load', '--input', tarball])


def start_devstack():
    """
    Start the devstack containers so their volumes can be populated.
    """
    cwd = os.getcwd()
    os.chdir(DEVSTACK_REPO_DIR)
    check_call(['make', 'dev.up'])
    os.chdir(cwd)


def load_volumes():
    """
    Restore the image volume content from the associated tarballs.
    """
    with open(VOLUMES_JSON, 'r') as f:
        volumes = json.loads(f.read())
    for volume in volumes:
        container_name = volume['container']
        path = volume['path']
        if path.endswith('/'):
            path = path[:-1]
        tarball = volume['tarball']
        components = str(path.count('/'))
        print('Loading volume from {}'.format(tarball))
        check_call(['docker', 'run', '--rm', '--volumes-from', container_name,
                    '-v', '{}:/backup'.format(VOLUMES_DIR), BACKUP_IMAGE,
                    'tar', 'xzf', '/backup/{}'.format(tarball), '-C', path,
                    '--strip-components', components])


if __name__ == "__main__":
    load_images()
    start_devstack()
    load_volumes()
