#! /bin/bash

useradd bketelsen -s /usr/bin/zsh -m 
chpasswd << 'END'
bketelsen:password
END
