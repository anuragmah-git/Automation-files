#!/bin/bash

echo "======= Display All Containers Names ========="

	docker inspect --format='{{.Name}}' $(docker ps -q) | cut -c2-

echo "==============="

echo "Inspect Container-names and store in text file"

	docker inspect --format='{{.Name}}' $(docker ps -q) | cut -c2- > Container_names.txt

echo "==============="

	mapfile -t names < Container_names.txt

for i in "${!names[@]}";
do

# Checking if docker container with $CONTAINER_NAME name exists.
COUNT=$(docker ps -a | grep "${names[$i]}" | wc -l)
if (($COUNT>0)); then
	echo "container exists"
	
	echo "Stop Container"
	docker stop "${names[$i]}"

	echo "Delete Container" 
	docker rm -f "${names[$i]}"

	#echo "create container"
	#docker run --name "${names[$i]}" -d -it ubuntu /bin/bash
else 
	echo "container not exist"

	echo "create multiple containers(N)"
	read N;
        for i in `seq $N`
	do
	docker run --name container$i -d -it ubuntu /bin/bash
	echo "==Containers Created=="
	done
	break
	
fi
done

echo "create multiple containers(N)"
	read N;
        for i in `seq $N`
	do
	docker run --name chef-tomcat$i -d -it tomcat:8.0 /bin/bash
	echo "==Containers Created=="
	done






