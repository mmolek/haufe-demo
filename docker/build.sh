#!/bin/bash

docker build -t haufe .
docker run -d -p 80:80 haufe


did=$(docker ps | awk '{print $1}' | tail -n1)
echo $did

sleep 60

docker stop $did

