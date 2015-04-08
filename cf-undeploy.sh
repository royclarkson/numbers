#!/bin/bash

# delete apps
cf delete numbers -f
cf delete numbers-service -f

# delete services
cf delete-service service-registry -f
cf delete-service circuit-breaker-dashboard -f
