#!/bin/bash

# delete services
cf delete-service service-registry -f
cf delete-service circuit-breaker-dashboard -f

# create services
cf create-service p-service-registry standard service-registry
cf create-service p-circuit-breaker-dashboard standard circuit-breaker-dashboard
