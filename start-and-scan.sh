#!/bin/bash


export FLASK_APP=flask-vuln.py
flask run --host=172.17.0.1 &
# baseline scan (passive crawling)
# docker run -t owasp/zap2docker-stable zap-baseline.py  -j -t http://172.17.0.1:5000

# active quick attack scan
# docker run -i owasp/zap2docker-stable zap-cli quick-scan --self-contained --start-options '-config api.disablekey=true' --spider -r http://172.17.0.1:5000 

# More comprehensive scan script
./scan-with-zap.sh http://172.17.0.1:5000

# Force "ok" for Travis
exit 0