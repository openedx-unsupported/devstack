#!/bin/bash

echo "-------------------------------------------------------"
echo "WeUpLearning Custom DevStack Install for juniper alpha1"
echo "-------------------------------------------------------"

echo "# Update repos and upgrade"
sudo apt-get update -y
sudo apt-get upgrade -y

echo "# Install docker and docker compose"
sudo apt install curl tmux nano apt-transport-https ca-certificates curl gnupg-agent software-properties-common make -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > ./docker-compose
sudo mv ./docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

echo "# Add your user to the docker group"
sudo usermod -aG docker ${USER}

echo "Please disconnect and reconnect..."
echo "Then run part2"
