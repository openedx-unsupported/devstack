#!/usr/bin/env python
"""
Script to capture a snapshot of the current devstack images, repositories,
and volume content to tarballs for no-network installation.  To be run while
devstack is running (otherwise volume content can't be accessed).
"""
from __future__ import absolute_import, print_function, unicode_literals

import argparse
import json
import os
import re
from shutil import copyfile
from subprocess import check_call

import yaml

REPO_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DEVSTACK_WORKSPACE = os.path.dirname(REPO_ROOT)
REPO_SCRIPT = os.path.join(REPO_ROOT, 'repo.sh')

# Use this minimal container image to fetch volume content
BACKUP_IMAGE = 'alpine:latest'


def make_directories(output_dir):
    """
    Create any of the output directories that don't already exist.
    """
    if not os.path.exists(output_dir):
        os.mkdir(output_dir)
    for dir_name in ('images', 'repositories', 'volumes'):
        path = os.path.join(output_dir, dir_name)
        if not os.path.exists(path):
            os.mkdir(path)


def archive_repos(output_dir):
    """
    Create tarballs for each of the relevant repositories in DEVSTACK_WORKSPACE
    """
    with open('repo.sh', 'r') as f:
        script = f.read()
    prefix = r'https://github\.com/edx/'
    suffix = r'\.git'
    repos = re.findall(r'{}[^\.]+{}'.format(prefix, suffix), script)
    dirs = [repo[len(prefix) - 1:1 - len(suffix)] for repo in repos if 'edx-themes' not in repo]
    dirs.append('devstack')
    repositories_dir = os.path.join(output_dir, 'repositories')
    cwd = os.getcwd()
    os.chdir(DEVSTACK_WORKSPACE)
    for directory in dirs:
        print('Archiving {}'.format(directory))
        output = os.path.join(repositories_dir, '{}.tar.gz'.format(directory))
        check_call(['tar', 'czf', output, directory])
    os.chdir(cwd)


def process_compose_file(filename, output_dir):
    """
    Go through the given docker-compose YAML file and save any of the
    referenced Docker images and data volumes to tarballs.
    """
    images_dir = os.path.join(output_dir, 'images')
    volumes_dir = os.path.join(output_dir, 'volumes')
    compose_path = os.path.join(REPO_ROOT, filename)
    with open(compose_path, 'r') as f:
        devstack = yaml.safe_load(f.read())

    volume_list = []
    services = devstack['services']
    saved_images = set()
    for service_name in services:
        service = services[service_name]
        image = service['image']
        image = re.sub(r'\$.*', 'latest', image)
        container_name = service['container_name']
        # Don't save the same image twice, like edxapp for lms and studio
        if image not in saved_images:
            output = os.path.join(images_dir, '{}.tar'.format(service_name))
            print('Saving image {}'.format(service_name))
            check_call(['docker', 'save', '--output', output, image])
            check_call(['gzip', output])
            saved_images.add(image)

        if 'volumes' in service:
            volumes = service['volumes']
            for volume in volumes:
                if volume[0] == '.':
                    # Mount of a host directory, skip it
                    continue
                parts = volume.split(':')
                volume_name = parts[0]
                volume_path = parts[1]
                tarball = '{}.tar.gz'.format(volume_name)
                volume_list.append({'container': container_name,
                                    'path': volume_path, 'tarball': tarball})
                print('Saving volume {}'.format(volume_name))
                check_call(['docker', 'run', '--rm', '--volumes-from', container_name, '-v',
                            '{}:/backup'.format(volumes_dir), BACKUP_IMAGE, 'tar', 'czf',
                            '/backup/{}'.format(tarball), volume_path])
    print('Saving image alpine')
    output = os.path.join(images_dir, 'alpine.tar')
    check_call(['docker', 'save', '--output', output, BACKUP_IMAGE])
    check_call(['gzip', output])
    print('Saving volume metadata')
    with open(os.path.join(volumes_dir, 'volumes.json'), 'w') as f:
        f.write(json.dumps(volume_list))


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('output_dir', help='The directory in which to create the devstack snapshot')
    args = parser.parse_args()
    output_dir = args.output_dir
    make_directories(output_dir)
    archive_repos(output_dir)
    process_compose_file('docker-compose.yml', output_dir)
    copyfile(os.path.join(REPO_ROOT, 'scripts', 'extract_snapshot_linux.sh'),
             os.path.join(output_dir, 'linux.sh'))
    copyfile(os.path.join(REPO_ROOT, 'scripts', 'extract_snapshot_mac.sh'),
             os.path.join(output_dir, 'mac.sh'))
