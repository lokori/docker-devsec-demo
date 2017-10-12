#!/bin/bash


export FLASK_APP=flask-vuln.py
flask run --host=172.17.0.1 &
docker run -t owasp/zap2docker-stable zap-baseline.py  -j -t http://172.17.0.1:5000
