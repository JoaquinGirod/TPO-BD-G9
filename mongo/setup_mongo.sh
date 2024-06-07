#!/bin/bash
CSV_PATH=albumlist.csv
CONTAINER_NAME=Mymongo

docker pull mongo
docker run --name $CONTAINER_NAME -p 27017:27017 -d mongo

docker cp $CSV_PATH $CONTAINER_NAME:/albumlist.csv
docker exec -it $CONTAINER_NAME mongoimport --db tpo --collection albums --type csv --headerline --file /$CSV_PATH
docker exec -it $CONTAINER_NAME mongosh 

