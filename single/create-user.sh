#! /bin/bash

useradd bketelsen -s /usr/bin/zsh -m 
sudo chpasswd << 'END'
bketelsen:password
END
