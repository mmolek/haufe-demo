#!/bin/bash

docker build -t haufe .
docker run -d -p 80:80 haufe

echo
echo
echo "Visit the http://<IP> and see the web page of the server in docker"
echo "You should get back something liek tihs"
echo
curl http://127.0.0.1/
echo
echo
echo

### Optionally stop the docker

#did=$(docker ps | awk '{print $1}' | tail -n1)
#echo $did
#docker stop $did

