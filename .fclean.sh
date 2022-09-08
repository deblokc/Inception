#!/bin/bash
./.clean.sh &> /dev/null
docker volume rm $(docker volume ls -q) &> /dev/null
docker rmi $(docker images -aq) &> /dev/null
docker network rm $(docker network ls -q) &> /dev/null
echo "fcleaned"
