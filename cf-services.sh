#!/bin/bash

# delete services
cf delete-service service-registry -f
cf delete-service circuit-breaker-dashboard -f
cf delete-service config-server -f

# create services
cf create-service p-service-registry standard service-registry
cf create-service p-circuit-breaker-dashboard standard circuit-breaker-dashboard
cf create-service p-config-server standard config-server
