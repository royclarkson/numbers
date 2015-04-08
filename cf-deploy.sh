#!/bin/bash

# delete apps
cf delete numbers -f
cf delete numbers-service -f

# delete services
cf delete-service service-registry -f
cf delete-service circuit-breaker-dashboard -f

# create services
cf create-service p-service-registry standard service-registry
cf create-service p-circuit-breaker-dashboard standard circuit-breaker-dashboard

# build apps
mvn clean package -f numbers-app/
mvn clean package -f numbers-service/

# wait for the broker to complete setup of the circuit-breaker-dashboard service
# sleep 120

# push apps and bind services using manifests
cf push numbers -f numbers-app/manifest.yml -p numbers-app/target/numbers-0.1.0.jar
cf push numbers-service -f numbers-service/manifest.yml -p numbers-service/target/numbers-service-0.1.0.jar

# restage apps to confirm bindings
cf restage numbers
cf restage numbers-service
