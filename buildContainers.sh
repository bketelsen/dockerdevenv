#! /bin/bash

set -e

cd osbase
echo "Building bketelsen/osbase"
docker build -t bketelsen/osbase .
docker push bketelsen/osbase

cd ../commandbase
echo "Building bketelsen/commandbase"
docker build -t bketelsen/commandbase .
docker push bketelsen/commandbase

cd ../uibase
echo "Building bketelsen/uibase"
docker build -t bketelsen/uibase .
docker push bketelsen/uibase

cd ../useradd
echo "Building bketelsen/useradd"
docker build -t bketelsen/useradd .
docker push bketelsen/useradd

cd ../devenv 
echo "Building bketelsen/devenv"
docker build -t bketelsen/devenv
docker push bketelsen/devenv

cd ..

