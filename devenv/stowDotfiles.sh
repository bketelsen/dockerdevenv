#! /bin/bash

set -e
cd /home/${1}/dotfiles
git pull
git submodule update --init --recursive
#install fonts
/home/${1}/dotfiles/_vendor/powerline-fonts/install.sh

# put vim config in place
stow -vv vim

#zsh
stow -vv zsh

#zsh-custom
stow -vv zsh-custom

#git
stow -vv git

#i3
rm -rf /home/${1}/.i3
stow -vv i3

#config
stow -vv config

