#!/bin/bash

CONTAINER_NAME='c4'
# Checking if docker container with $CONTAINER_NAME name exists.
COUNT=$(docker ps -a | grep "$CONTAINER_NAME" | wc -l)
if (($COUNT > 0)); then
    echo 'container exists'
fi

