#!/bin/bash

set -eu

# Default for docker-machine based local test
URL=${1:-http://10.0.2.2:5000}
# URL='http://172.17.0.1:5000'


DOCKER=`which docker`
IMAGE='owasp/zap2docker-stable'


echo "Scanning target URL: $URL"

# start container, mount report directory
docker run --name zappen -v $PWD/reports:/zap/reports:rw -i -t -d owasp/zap2docker-stable bash

docker exec zappen zap-cli start -o '-config api.disablekey=true'

# Here is the point to configure possible authentication/scripts/context 
# something like this for example:
# docker exec zappen zap-cli -p 8510 scripts load --name=force-auth --script-type=proxy --engine='Oracle Nashorn' --file-path=/zap/zap-header.js


# TODO: AJAX-spider
docker exec zappen zap-cli open-url $URL
docker exec zappen zap-cli spider $URL

# recursive attack
docker exec zappen zap-cli active-scan -r $URL

# Create report
echo 'Creating report'
docker exec zappen zap-cli report  -o /zap/reports/report.html -f html

echo 'Shutting down the Docker container'
$DOCKER kill zappen
$DOCKER rm zappen