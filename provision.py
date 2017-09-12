import os
import sys
import subprocess
import time

import click
from collections import defaultdict


os.environ['RED'] = '\\033[0;31m'
os.environ['GREEN'] = '\\033[0;32m'
os.environ['YELLOW'] = '\\033[0;33m'
os.environ['NC'] = '\\033[0m'  # No Color

defined_apps = {
    'credentials': './provision-credentials.sh',
    'discovery': './provision-discovery.sh',
    'e2e': './provision-e2e.sh',
    'forum': './provision-forum.sh',
    'lms': './provision-lms'
}

pre_app_commands = defaultdict(list)
# Add pre_app_commands here, key should be the app name as defined above. Use .append to add to the list
# of scripts to run for each application.

post_app_commands = defaultdict(list)
post_app_commands['lms'].append('docker-compose $DOCKER_COMPOSE_FILES up -d studio',)

pre_provisioning_commands = [
    './provision-db.sh',
]

post_provisioning_commands = [
    'docker image prune -f',
    'echo -e "${GREEN}Provisioning complete!${NC}"'
]


@click.command()
@click.argument('requested_apps', nargs=-1)
def provision(requested_apps):
    if len(requested_apps) < 1:
        requested_apps = defined_apps

    # Run the pre_provisioning scripts
    for pre_provisioning_command in pre_provisioning_commands:
        run_command(pre_provisioning_command)

    # run the app provisioning scripts
    for app_name, command in requested_apps.items():
        # run the pre_app command if any
        for pre_command in pre_app_commands.get(app_name, []):
            run_command(command)
        run_command(command)
        for post_command in post_app_commands.get(app_name, []):
            run_command(post_command)

    # Run post provisioning scripts
    for post_provisioning_command in post_provisioning_commands:
        run_command(pre_provisioning_command)


def run_command(command):
    print("Running command: {}".format(command))
    p = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    while p.poll() is None:
        output = p.stdout.readline() + p.stderr.readline()
        print(output)
        # time.sleep()
    print(p.stdout.read())
    print(p.stderr.read())
    if p.poll() != 0:
        sys.exit(p.poll())


if __name__ == '__main__':
    provision()