# init django environment
import importlib
import os
import sys
sys.path.append("/edx/app/edxapp/edx-platform")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "lms.envs.devstack_docker")
os.environ.setdefault("SERVICE_VARIANT", "lms")
startup = importlib.import_module("lms.startup")
startup.run()


# Python std lib
import json

# 3rd-party
from django.contrib.sites.models import Site

# openedx
from openedx.core.djangoapps.theming.models import SiteTheme


def update_json_file(json_filename, json_updates_filename):

    with open(json_filename, 'r') as f:
        content = json.load(f)
    with open(json_updates_filename, 'r') as f:
        json_updates = json.load(f)
    content.update(json_updates)
    with open(json_filename, 'w') as f:
        f.write(json.dumps(content, sort_keys=True, indent=4, separators=(',', ': ')))

def update_site_config(site_config_updates_filename):

    with open(site_config_updates_filename, 'r') as f:
        site_config_changes = json.load(f)
    site = Site.objects.get(name='example.com')
    site_config = getattr(site, "configuration")
    for key,value in site_config_changes.items():
        site_config.values[key] = value
    site_config.save()

def update_site_theme(theme_dir):

    site = Site.objects.get(name='example.com')
    theme = SiteTheme(site=site,theme_dir_name=theme_dir)
    theme.save()


import argparse
parser = argparse.ArgumentParser(description='Set HMS configuration')
parser.add_argument('settings_updates_filename', help='Django settings JSON updates filename')
parser.add_argument('site_config_updates_filename', help='Django site configuration JSON updates filename')
args = parser.parse_args()

# update Django site theme
update_site_theme("hms")
# update Django settings
update_json_file("/edx/app/edxapp/lms.env.json", args.settings_updates_filename)
# update Django site configuration variables
update_site_config(args.site_config_updates_filename)

