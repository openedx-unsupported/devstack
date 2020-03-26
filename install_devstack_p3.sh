#!/bin/bash

echo "-------------------------------------------------------"
echo "WeUpLearning Custom DevStack Install for juniper alpha1"
echo "-------------------------------------------------------"

echo "# Part3 !"

echo "# Instaling pre-requisites that will move later to requirements"
cd ~/edx/devstack_files/devstack/
docker-compose exec -T lms bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && pip install img2pdf==0.3.3 python-resize-image==1.1.19 xlwt==1.3.0'
docker-compose exec -T studio bash -c 'source /edx/app/edxapp/edxapp_env && cd /edx/app/edxapp/edx-platform && pip install img2pdf==0.3.3 python-resize-image==1.1.19 xlwt==1.3.0'

echo "# Fetching code for atp_juniper"
cd ~/edx/devstack_files/edx-platform
git fetch origin atp_juniper:atp_juniper
git checkout atp_juniper

cd ~/edx/devstack_files/devstack/

echo "# Migrating"
make studio-update-db
make lms-update-db

echo "# Pavering"
make lms-static
make studio-static

echo "Restart"
make lms-restart
make studio-restart
