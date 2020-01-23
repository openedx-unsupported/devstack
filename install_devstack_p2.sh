#!/bin/bash

echo "-------------------------------------------------------"
echo "WeUpLearning Custom DevStack Install for juniper alpha1"
echo "-------------------------------------------------------"

echo "# Part2 !"

echo "# Creating directories"
cd ~
mkdir edx
cd edx
mkdir devstack_files
cd devstack_files

echo "#Cloning devstack"
git clone https://github.com/weuplearning/devstack
cd devstack
git checkout open-release/juniper.alpha1

echo "#Starting deployment"
export OPENEDX_RELEASE=juniper.alpha1
make dev.checkout
make dev.clone
make dev.provision
make dev.up
