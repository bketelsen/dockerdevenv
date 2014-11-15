#! /bin/bash

set -e
cd /home/${1}
echo `pwd`
echo $1
echo `whoami`
git clone https://github.com/${1}/dotfiles /home/${1}/dotfiles
cd /home/${1}/dotfiles
#get fonts
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
