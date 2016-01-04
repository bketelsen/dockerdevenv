#! /bin/bash

set -e
# Install development packages
DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python-pip build-essential git-core mercurial bzr python-dev ctags cmake software-properties-common python-software-properties direnv

DEBIAN_FRONTEND=noninteractive add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:neovim-ppa/unstable 
DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install python3-dev python3-pip
DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install neovim
easy_install supervisor
pip install neovim




