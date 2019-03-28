#!/bin/bash

docker run -d --net movielistnet --ip 172.18.1.1 --hostname consul --name consul -it consul

docker run -d --net movielistnet --ip 172.18.1.2 --hostname mongodb --name mongodb -it mongo

docker run -d --net movielistnet --ip 172.18.1.3 --add-host consul:172.18.1.1 --add-host mongodb:172.18.1.2 --name movie-list-service -it movie-list-service

docker run -d --net movielistnet --ip 172.18.1.4 --add-host consul:172.18.1.1 --name omdb-service -it omdb-service

docker run -d --net movielistnet --ip 172.18.1.5 -p 8080:8080 --add-host consul:172.18.1.1 --name gateway-service -it gateway-service

