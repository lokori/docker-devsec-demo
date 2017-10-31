#!/bin/sh

# https://github.com/lokori/findbugs-security-docker

docker pull lokori/findbugs-sec
docker run --rm -v `pwd`:/workdir/src lokori/findbugs-sec  -html:fancy-hist.xsl -output /workdir/src/reports/findsec-report.html src


