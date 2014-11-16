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

# Run as user for configs to stick
USER bketelsen
RUN /src/provision/customize-user.sh

USER root
RUN /src/provision/root-user-customize.sh

USER bketelsen  
WORKDIR /home/bketelsen

# these are required by various parts of X, i3, zsh
ENV HOME /home/bketelsen
ENV USER bketelsen
ENV TEMP /tmp


EXPOSE 5901
EXPOSE 5902
CMD  /src/provision/startup.sh




