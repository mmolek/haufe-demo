#!/bin/bash

echo "Will display all users present on the system line by line..."
echo ""
cat /etc/passwd | cut -d ":" -f1
echo ""

echo "Here is the map of listening ports in correlation to service binary path"
echo "NOTE: The ones taht point to and empty filed mean that the process name is not a root process and therefore which cannot find a binary path to it"
echo
echo 

N=0
M=0

for i in $(netstat -tulpane | grep LISTEN | awk '{print $4}' | rev|   cut -d ":" -f1 | rev | sort | uniq) ; do
  ports[$N]="$i"
  let "N= $N + 1"
done

for j in $( netstat -tulpane | grep LISTEN | awk '{print $9}' | cut -d "/" -f1 | sort | uniq  ) ; do
  services[$M]="$j"
  let "M= $M + 1"
done

for index in ${!ports[*]}; do
  service_name=$(ps -p ${services[$index]} -o comm= )
  binary_path=$(which $service_name 2>/dev/null )
  echo "Port  ${ports[$index]} ========>  $binary_path " 2>/dev/null 
done
