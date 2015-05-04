#!/bin/bash

# build apps
mvn clean package -f numbers-app/
mvn clean package -f numbers-service/

# delete apps
cf delete numbers -f
cf delete numbers-service -f

# push apps
cf push numbers -p numbers-app/target/numbers-0.1.0.jar
cf push numbers-service -p numbers-service/target/numbers-service-0.1.0.jar

cf bind-service numbers service-registry
cf bind-service numbers-service service-registry
cf bind-service numbers-service circuit-breaker-dashboard

# restage apps to confirm bindings
cf restage numbers
cf restage numbers-service

# scale up the numbers-service
cf scale numbers-service -i 2 -f
