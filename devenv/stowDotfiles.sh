#! /bin/bash

set -e

cd /home/bketelsen/dotfiles
#get fonts
git submodule update --init --recursive

#install fonts
/home/bketelsen/dotfiles/vendor/powerline-fonts/install.sh

# put vim config in place
stow -vv vim

#zsh
stow -vv zsh

#zsh-custom
stow -vv zsh-custom

#git
stow -vv git
