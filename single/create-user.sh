#! /bin/bash
set -e

useradd bketelsen -s /usr/bin/zsh -m 
chpasswd << 'END'
bketelsen:password
END
echo 'bketelsen  ALL=(ALL:ALL) ALL' >> /etc/sudoers
