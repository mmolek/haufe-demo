#!/bin/bash

docker build -t haufe .
docker run -d -p 80:80 haufe


### Optionally stop the docker

#did=$(docker ps | awk '{print $1}' | tail -n1)
#echo $did
#docker stop $did

