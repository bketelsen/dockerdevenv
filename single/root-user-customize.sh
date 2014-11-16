#! /bin/bash

chown -R bketelsen /home/bketelsen && chgrp -R bketelsen /home/bketelsen
chmod 400 /home/bketelsen/.vnc/passwd
chmod +x /home/bketelsen/.vnc/xstartup
chsh -s /usr/bin/zsh bketelsen
