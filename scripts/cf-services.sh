#!/bin/bash

cf create-service p-service-registry standard service-registry
cf create-service p-circuit-breaker-dashboard standard circuit-breaker-dashboard
cf create-service p-config-server standard config-server -c config-server.json
