FROM bketelsen/useradd

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
ENV user bketelsen
USER root
RUN chsh -s /usr/bin/zsh $user
ADD stowDotfiles.sh /home/$user/bin/stowDotfiles.sh
RUN chown $user:$user /home/$user/bin/stowDotfiles.sh
ADD dotfiles /home/$user/dotfiles
RUN chown -R $user:$user /home/$user/dotfiles
USER $user
ENTRYPOINT /home/$user/bin/stowDotfiles.sh $user && supervisord -n -c /home/$user/supervisord.conf
