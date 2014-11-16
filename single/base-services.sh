#! /bin/bash
# Install basic packages required for any scenario

# abort on errors 
set -e
# don't expect a tty
export DEBIAN_FRONTEND noninteractive
apt-get update && apt-get install -y openssh-server \
      ca-certificates curl unzip tar \
      zsh stow   
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

