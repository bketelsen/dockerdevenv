#!/bin/bash


git clone https://github.com/bketelsen/dotfiles /home/bketelsen/dotfiles
#git pull
cd /home/bketelsen/dotfiles && git submodule update --init --recursive
#install fonts
/home/bketelsen/dotfiles/_vendor/powerline-fonts/install.sh

# put vim config in place
cd /home/bketelsen/dotfiles  
stow -vv vim  
stow -vv neovim
stow -vv zsh 
stow -vv zsh-custom 
stow -vv git 
rm -rf /home/bketelsen/.i3 
stow -vv config



