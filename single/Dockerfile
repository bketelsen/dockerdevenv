FROM ubuntu
MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
ADD base-services.sh /usr/local/bin/
ADD create-user.sh /usr/local/bin/
ADD customize-user.sh /usr/local/bin/
ADD dev-packages.sh /usr/local/bin/
ADD install-go.sh /usr/local/bin/
ADD install-ui.sh /usr/local/bin/

RUN base-services.sh
RUN dev-packages.sh
RUN install-go.sh
RUN install-ui.sh

#add required files after creating user
RUN create-user.sh

ADD supervisord.conf /home/bketelsen/supervisord.conf
ADD vncpasswd /home/bketelsen/.vnc/passwd
ADD xstartup /home/bketelsen/.vnc/xstartup

RUN customize-user.sh



  
WORKDIR /home/bketelsen
USER bketelsen
# these are required by various parts of X, i3, zsh
ENV HOME /home/bketelsen
ENV USER bketelsen
ENV TEMP /tmp


EXPOSE 5901
EXPOSE 5902
ADD startup.sh 
CMD  startup.sh




