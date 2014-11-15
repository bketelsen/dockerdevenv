FROM bketelsen/uibase

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
USER root
ENV user bketelsen 
RUN adduser $user && echo "$user:$user" | chpasswd && adduser $user sudo

ADD supervisord.conf /home/$user/supervisord.conf

ADD vncpasswd /home/$user/.vnc/passwd
ADD xstartup /home/$user/.vnc/xstartup
RUN chown $user:$user -R /home/$user/.vnc/
RUN chown $user:$user /home/$user/supervisord.conf
RUN chmod 400 /home/$user/.vnc/passwd

USER $user

ENV HOME /home/$user

WORKDIR /home/$user/
VOLUME /home/$user
RUN echo "exec i3" > /home/$user/.xinitrc
EXPOSE 5901
EXPOSE 5902

#for vnc
ENV USER $user
RUN chmod +x /home/$user/.vnc/xstartup

ENTRYPOINT /bin/bash

