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
            print(f"Creating test data in {ida_name} based on {ida_data_spec_yaml}")
            if ida_name == "lms" or ida_name == "cms":
                subprocess.run(f"docker-compose exec -T {ida_name} bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform/ && python manage.py {ida_name} load_data --data-file-path {ida_data_spec_yaml}'", shell=True)
            else:
                subprocess.call(f"docker-compose exec -T {ida_name} bash -c 'source /edx/app/{ida_name}/{ida_name}_env && cd /edx/app/{ida_name}/{ida_name}/ && python manage.py load_data --data-file-path {ida_data_spec_yaml}'", shell=True)


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        print("Path to data spec yaml not specified")
