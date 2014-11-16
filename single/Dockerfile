FROM ubuntu
MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y openssh-server \
      ca-certificates curl unzip tar python-pip build-essential \
      git-core mercurial bzr zsh stow python-dev ctags \
      i3 terminator feh dmenu dunst connman-ui rox-filer \
      hexchat tightvncserver vim-gtk 

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /usr/local/go && curl -Ls https://storage.googleapis.com/golang/go1.3.3.linux-amd64.tar.gz | tar zxvf - -C /usr/local/go --strip-components=1
RUN easy_install supervisor






RUN adduser --disabled-password --gecos "" --home=/home/bketelsen bketelsen && adduser bketelsen sudo
#### add files here
# supervisor
ADD supervisord.conf /home/bketelsen/supervisord.conf
ADD vncpasswd /home/bketelsen/.vnc/passwd
ADD xstartup /home/bketelsen/.vnc/xstartup
RUN echo "exec i3" > /home/bketelsen/.xinitrc



RUN chown -R bketelsen /home/bketelsen && chgrp -R bketelsen /home/bketelsen
RUN chmod 400 /home/bketelsen/.vnc/passwd
RUN chmod +x /home/bketelsen/.vnc/xstartup

  
WORKDIR /home/bketelsen
USER bketelsen
# these are required by various parts of X, i3, zsh
ENV HOME /home/bketelsen
ENV USER bketelsen
ENV TEMP /tmp

## Dotfiles

RUN git clone https://github.com/bketelsen/dotfiles /home/bketelsen/dotfiles
#git pull
RUN cd /home/bketelsen/dotfiles && git submodule update --init --recursive
#install fonts
RUN /home/bketelsen/dotfiles/_vendor/powerline-fonts/install.sh

# put vim config in place
RUN cd /home/bketelsen/dotfiles \ 
  && stow -vv vim \ 
  && stow -vv zsh \
  && stow -vv zsh-custom \
  && stow -vv git \
  && rm -rf /home/${1}/.i3 \
  stow -vv i3 && \
  stow -vv config



EXPOSE 5901
EXPOSE 5902

ENTRYPOINT /bin/bash
CMD /bin/bash



