#!/bin/bash
CSV_PATH=bataxi.csv
PYTHON_IMPORT_PATH=import_redis.py
BASH_EXECUTION_PATH=queries.sh
CONTAINER_NAME=Myredis

docker pull redis
docker run --name $CONTAINER_NAME -p 6379:6379 -d redis

docker cp $CSV_PATH $CONTAINER_NAME:/$CSV_PATH
docker cp $BASH_EXECUTION_PATH $CONTAINER_NAME:/$BASH_EXECUTION_PATH
python import_redis.py 

docker exec -it $CONTAINER_NAME bash -c "bash /$BASH_EXECUTION_PATH"

