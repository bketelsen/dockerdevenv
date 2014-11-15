FROM bketelsen/useradd

MAINTAINER Brian Ketelsen <bketelsen@gmail.com>

ENV USER bketelsen
VOLUME /home/bketelsen

ENTRYPOINT supervisord -n -c /home/bketelsen/supervisord.conf
