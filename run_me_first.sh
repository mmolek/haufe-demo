#!/bin/bash

cd ansible
ansible-playbook -i inventory haufe.yml
cd ../docker
./build.sh
cd ..
./bashtasks.sh

