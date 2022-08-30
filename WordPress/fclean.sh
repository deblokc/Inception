#!/bin/bash
./clean.sh &> /dev/null
docker rmi $(docker images -aq) &> /dev/null
echo "fcleaned"
