FROM bketelsen/uibase

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>

RUN adduser bketelsen && echo "bketelsen:bketelsen" | chpasswd && adduser bketelsen sudo

ADD supervisord.conf /home/bketelsen/supervisord.conf

ADD vncpasswd /home/bketelsen/.vnc/passwd
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

ENTRYPOINT /bin/bash

