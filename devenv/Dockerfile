FROM bketelsen/useradd

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>
ENV user bketelsen
USER root
RUN chsh -s /usr/bin/zsh $user
ADD stowDotfiles.sh /home/$user/stowDotfiles.sh
USER $user
ENV TEMP /tmp
ENTRYPOINT /home/$user/stowDotfiles.sh $user && supervisord -n -c /home/$user/supervisord.conf
