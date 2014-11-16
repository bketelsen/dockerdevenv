FROM ubuntu
MAINTAINER Brian Ketelsen <bketelsen@gmail.com>

ADD . /src/provision

RUN /src/provision/base-services.sh
RUN /src/provision/dev-packages.sh
RUN /src/provision/install-go.sh
RUN /src/provision/install-ui.sh

#add required files after creating user
RUN /src/provision/create-user.sh

ADD supervisord.conf /home/bketelsen/supervisord.conf
ADD vncpasswd /home/bketelsen/.vnc/passwd
ADD xstartup /home/bketelsen/.vnc/xstartup

RUN /src/provision/customize-user.sh



  
WORKDIR /home/bketelsen
USER bketelsen
# these are required by various parts of X, i3, zsh
ENV HOME /home/bketelsen
ENV USER bketelsen
ENV TEMP /tmp


EXPOSE 5901
EXPOSE 5902
ADD startup.sh /home/bketelsen/bin/startup.sh
CMD  /home/bketelsen/bin/startup.sh




