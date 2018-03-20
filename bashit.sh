#!/bin/bash

echo "Will display  all users line by line..."
cat /etc/passwd | cut -d ":" -f1
