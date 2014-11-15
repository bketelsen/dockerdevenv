FROM bketelsen/commandbase

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>

RUN apt-get update && apt-get install -y i3 terminator feh dmenu dunst connman-ui rox-filer hexchat tightvncserver vim-gtk 
RUN easy_install supervisor

ENTRYPOINT /bin/bash

