#!/usr/bin/env bash

# Docker CE dependencies
# https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Docker Official GPG
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Docker Repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# list avaiable versions
sudo apt-get update
apt-cache madison docker-ce

codename=$(lsb_release -cs)
sudo apt-get install -y docker-ce=5:19.03.12~3-0~ubuntu-${codename} docker-ce-cli=5:19.03.12~3-0~ubuntu-${codename}
sudo gpasswd -a $(whoami) docker
