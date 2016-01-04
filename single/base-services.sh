#! /bin/bash
# Install basic packages required for any scenario

# abort on errors 
set -e
# don't expect a tty

DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y ca-certificates curl unzip tar zsh stow xclip

