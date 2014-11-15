FROM bketelsen/useradd

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
ENV user bketelsen
USER root
RUN chsh -s /usr/bin/zsh $user
ADD stowDotfiles.sh /home/$user/bin/stowDotfiles.sh
ADD config /home/$user/.i3/config
RUN chown $user:$user /home/$user/.i3/config
RUN chown $user:$user /home/$user/bin/stowDotfiles.sh
USER $user
ENTRYPOINT /home/$user/bin/stowDotfiles.sh $user && supervisord -n -c /home/$user/supervisord.conf
