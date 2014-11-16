#! /bin/bash
# Install development packages
export DEBIAN_FRONTEND noninteractive
apt-get update && apt-get install -y python-pip build-essential git-core mercurial bzr python-dev ctags
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
easy_install supervisor




