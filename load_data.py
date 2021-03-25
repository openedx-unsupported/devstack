#!/usr/bin/env python3

import yaml
import sys
import subprocess


def main(input_yaml_path):
    with open(input_yaml_path, 'r') as f:
        top_data_spec_yaml = yaml.safe_load(f)
        for data_spec_path in top_data_spec_yaml:
            ida_name = data_spec_path['ida_name']
            ida_data_spec_yaml = data_spec_path['data_spec_path']
            # See if spec yaml is in devstack repo
            spec_in_devstack = data_spec_path.get('spec_in_devstack', False)
            if spec_in_devstack:
                # if spec yaml is in devstack repo, move it into /tmp directory of container
                ida_data_spec_yaml = copy_file_to_container(ida_name, ida_data_spec_yaml)
            print(f"Creating test data in {ida_name} based on {ida_data_spec_yaml}")
            if ida_name == "lms" or ida_name == "cms":

                subprocess.run(f"docker-compose exec -T {ida_name} bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && python manage.py {ida_name} load_data --data-file-path {ida_data_spec_yaml}'", shell=True)
            else:
                subprocess.call(f"docker-compose exec -T {ida_name} bash -c 'source /edx/app/{ida_name}/{ida_name}_env && cd /edx/app/{ida_name}/{ida_name}/ && python manage.py load_data --data-file-path {ida_data_spec_yaml}'", shell=True)

def copy_file_to_container(ida_name, file_path):
    """
    Use if data spec file is in devstack repo and it needs to move to the container
    """
    # First get container id
    captured_output = subprocess.run(f"docker-compose ps --quiet {ida_name}", shell=True, capture_output=True)
    if captured_output.returncode == 0:
        container_id = captured_output.stdout.decode().strip()
        container_file_path = "/tmp/data_spec.yaml"
        move_file_captured_output = subprocess.run(f"docker cp {file_path} {captured_output}:{container_file_path}", shell=True)
        if move_file_captured_output.returncode != 0:
            raise Exception("Stuff broke TODO")
        return container_file_path
    else:
        raise Exception("Stuff broke TODO")


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        print("Path to data spec yaml not specified")
