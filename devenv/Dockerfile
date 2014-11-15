FROM bketelsen/useradd

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
ENV user bketelsen
RUN cd /home/$user && git clone https://github.com/$user/dotfiles
USER root
RUN chsh -s /usr/bin/zsh $user
USER $user
ENTRYPOINT supervisord -n -c /home/$user/supervisord.conf
