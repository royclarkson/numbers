#!/bin/bash

set -e

# build apps
mvn clean package -f numbers-app/
mvn clean package -f numbers-service/

# push apps
cf push -f numbers-app/manifest-pcf.yml -p numbers-app/target/numbers-0.1.0.jar
cf push -f numbers-service/manifest-pcf.yml -p numbers-service/target/numbers-service-0.1.0.jar
