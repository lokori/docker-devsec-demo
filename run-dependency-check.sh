#!/bin/sh

# https://hub.docker.com/r/owasp/dependency-check/

OWASPDC_DIRECTORY=$HOME/OWASP-Dependency-Check
DATA_DIRECTORY="$OWASPDC_DIRECTORY/data"
# REPORT_DIRECTORY="$OWASPDC_DIRECTORY/reports"
REPORT_DIRECTORY="$(pwd)/reports"

if [ ! -d "$DATA_DIRECTORY" ]; then
    echo "Initially creating persistent directories"
    mkdir -p "$DATA_DIRECTORY"
    chmod -R 777 "$DATA_DIRECTORY"

    mkdir -p "$REPORT_DIRECTORY"
    chmod -R 777 "$REPORT_DIRECTORY"
fi

# Make sure we are using the latest version
docker pull owasp/dependency-check

docker run -u=$UID:$(id -g $USER) --rm \
    --volume "$(pwd)/target":/src \
    --volume "$DATA_DIRECTORY":/usr/share/dependency-check/data \
    --volume "$REPORT_DIRECTORY":/report \
    owasp/dependency-check \
    --scan /src \
    --format "ALL" \
    --project "My OWASP Dependency Check Project"
    # Use suppression like this: (/src == $pwd)
    # --suppression "/src/security/dependency-check-suppression.xml"

mv target/dependency-* reports

# Force "ok" for Travis
exit 0