FROM bketelsen/useradd

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>

RUN cd /home/bketelsen && git clone https://github.com/bketelsen/dotfiles
RUN chsh /usr/bin/zsh
ENTRYPOINT supervisord -n -c /home/bketelsen/supervisord.conf
