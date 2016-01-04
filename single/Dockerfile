FROM ubuntu:15.10
MAINTAINER Brian Ketelsen <bketelsen@gmail.com>

ADD . /src/provision

RUN /src/provision/base-services.sh
RUN /src/provision/dev-packages.sh
RUN /src/provision/install-go.sh

#add required files after creating user
RUN /src/provision/create-user.sh

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

RUN mkdir /home/bketelsen/src && chown -R bketelsen:bketelsen /home/bketelsen/src
VOLUME /home/bketelsen/src
RUN touch /home/bketelsen/src/.thing
CMD [/usr/bin/zsh]




