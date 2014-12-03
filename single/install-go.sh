#! /bin/bash

mkdir -p /usr/local/go && curl -Ls https://storage.googleapis.com/golang/go1.4rc2.linux-amd64.tar.gz | tar xvzf - -C /usr/local/go --strip-components=1

