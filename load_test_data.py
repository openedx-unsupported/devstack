#!/usr/bin/env python3

import yaml
import sys
import subprocess


def main(input_yaml_path):
    with open(input_yaml_path, 'r') as f:
        paths = yaml.safe_load(f)
        for data_spec_path in paths:
            ida_name = data_spec_path['ida_name']
            ida_data_spec_yaml = data_spec_path['data_spec_path']
            print(f"{ida_name}: {ida_data_spec_yaml} ")
            if ida_name == "lms" or ida_name == "cms":
                print("running suprocess command")
                # TODO:Debug(jinder): this command does not run with error: 'manage.py' no such file or directory.
                subprocess.run(f"docker-compose exec -T {ida_name} bash -c 'python manage.py' {ida_name} load_test_data --data-file-path {ida_data_spec_yaml}", shell=True)
            else:
                pass
                # subprocess.call(f"docker-compose exec -T {ida_name} bash -c 'python manage.py' load_test_data --data-file-path {ida_data_spec_yaml} ")


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        print("did not receive enough inputs")
