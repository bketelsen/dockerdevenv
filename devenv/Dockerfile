FROM bketelsen/useradd

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
ENV user bketelsen
RUN cd /home/$user && git clone https://github.com/$user/dotfiles
RUN chsh /usr/bin/zsh
ENTRYPOINT supervisord -n -c /home/$user/supervisord.conf
