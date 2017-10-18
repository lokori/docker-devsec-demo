#!/bin/sh

# https://github.com/lokori/findbugs-security-docker

docker pull lokori/findbugs-sec
docker run  -v `pwd`/src/java:/workdir/src lokori/findbugs-sec src

