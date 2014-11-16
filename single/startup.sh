#! /bin/bash
# Run this script as the entrypoint of your container.
supervisord -n -c /home/bketelsen/supervisord.conf
