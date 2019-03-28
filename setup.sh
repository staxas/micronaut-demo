#!/bin/bash

docker network create --subnet=172.18.0.0/16 movielistnet

cd gateway-service

mvn clean verify

docker build --tag=gateway-service .

cd ../movie-list-service

mvn clean verify

docker build --tag=movie-list-service .

cd ../omdb-service

mvn clean verify

docker build --tag=omdb-service .

cd ..
