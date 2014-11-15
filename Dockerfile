FROM dockerfile/ubuntu

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>

RUN apt-get update && apt-get install -y i3 curl unzip tar openssh-server terminator feh dmenu dunst connman-ui rox-filer hexchat python-pip tightvncserver build-essential git-core mercurial bzr
RUN easy_install supervisor

# System setup complete, now create dev environment

RUN adduser bketelsen && echo "bketelsen:bketelsen" | chpasswd && adduser bketelsen sudo

ADD ./supervisord.conf /home/bketelsen/supervisord.conf

ADD ./vncpasswd /home/bketelsen/.vnc/passwd
ADD xstartup /home/bketelsen/.vnc/xstartup

RUN chown bketelsen:bketelsen -R /home/bketelsen/.vnc/

RUN chmod 400 /home/bketelsen/.vnc/passwd

USER bketelsen

ENV HOME /home/bketelsen

WORKDIR /home/bketelsen/
VOLUME /home/bketelsen
RUN echo "exec i3" > /home/bketelsen/.xinitrc
EXPOSE 5901
ENV USER bketelsen
RUN chmod +x /home/bketelsen/.vnc/xstartup
ADD config /home/bketelsen/.i3/config
#ENTRYPOINT /bin/bash
ENTRYPOINT supervisord -n -c /home/bketelsen/supervisord.conf
