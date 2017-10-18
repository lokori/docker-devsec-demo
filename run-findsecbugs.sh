#!/bin/sh

# https://github.com/lokori/findbugs-security-docker

docker pull lokori/findbugs-sec
docker run  -v `pwd`:/workdir/src lokori/findbugs-sec src

# getting the report out of the container use something like this
# -html -output /workdir/src/findsec-report.html src
