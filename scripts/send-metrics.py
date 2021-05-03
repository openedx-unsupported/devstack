#!/usr/bin/env python3
"""
Python script to collect metrics on devstack make targets.
The script calls the specified make target and records:
- target start time
- target end time
- target name

This data is collected to determine the performance of devstack's make targets.
"""
import subprocess
import sys
import datetime
from os import path

def send_metrics(make_target):
    """
    Runs specified make shell target and collects performance data.
    """
    t0 = datetime.datetime.now()
    completed_process = run_target(make_target)
    t1 = datetime.datetime.now()
    exit_code = completed_process.returncode
    time_diff = t1.timestamp() - t0.timestamp()
    output = {"target":make_target, "t0":t0, "time_diff":time_diff, "exit_code": exit_code}
    print(f"send metrics info: {output}", file=sys.stderr)

def run_target(make_target):
    return subprocess.run(["make", f"impl-{make_target}"])
    # return subprocess.run(["ls"])

def main(make_target):
    # Collect data only if user has concented to data collection by creating a file named: ~/.config/devstack/metrics.json
    if path.exists(path.expanduser("~/.config/devstack/metrics.json")):
        send_metrics(make_target)
    else:
        run_target(make_target)

if __name__ == "__main__":
    # if no target is specified, print error and exit.
    if len(sys.argv)>1:
        main(sys.argv[1])
    else:
        print("No make target specified")
