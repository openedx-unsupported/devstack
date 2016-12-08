#!/usr/bin/env python3
"""
Python 3 script for cloning Git repos housing edX services.

These repos are mounted as data volumes into their corresponding Docker
containers to facilitate development.

Repo clone URLs can be found in settings.yml. Repos are cloned to the directory
above the one housing this file.
"""
import concurrent.futures
import logging
from logging.config import dictConfig
from os.path import join, abspath, dirname
import re
import subprocess

import yaml


# Configure logging.
dictConfig({
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'standard': {
            'format': '%(asctime)s %(levelname)s %(process)d [%(filename)s:%(lineno)d] - %(message)s',
        },
    },
    'handlers': {
        'console': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'standard',
        },
    },
    'loggers': {
        '': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': False
        },
    },
})
logger = logging.getLogger(__name__)


class Repo:
    """Utility class representing a Git repo."""
    def __init__(self, clone_url):
        self.clone_url = clone_url
        match = re.match(r'.*edx/(?P<name>.*).git', self.clone_url)
        self.name = match.group('name')

    def clone(self):
        """Clone the repo."""
        parent_path = dirname(dirname(abspath(__file__)))
        clone_path = join(parent_path, self.name)
        subprocess.run(['git', 'clone', self.clone_url, clone_path], check=True)


if __name__ == '__main__':
    with open('settings.yml') as f:
        settings = yaml.load(f)

    repos = [Repo(clone_url) for clone_url in settings['repos']]

    logger.info(
        'Cloning. Target repos are: {}.'.format(
            ', '.join(repo.name for repo in repos)
        )
    )

    with concurrent.futures.ThreadPoolExecutor() as executor:
        for repo in repos:
            executor.submit(repo.clone)

    logger.info('Cloning complete.')
