#!/bin/bash

set -e

cd config-server
mvn clean package

cd ../eureka-server/
mvn clean package

cd ../hystrix-dashboard/
mvn clean package

cd ../numbers-app/
mvn clean package

cd ../numbers-service/
mvn clean package

cd ../
