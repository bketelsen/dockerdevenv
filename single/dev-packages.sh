#! /bin/bash
# Install development packages
DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python-pip build-essential git-core mercurial bzr python-dev ctags cmake
DEBIAN_FRONTEND=noninteractive apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
easy_install supervisor




