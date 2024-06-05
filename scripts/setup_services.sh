#!/bin/bash

# Update the package list
sudo apt-get update

# Install Redis
sudo apt-get install -y redis-server

# Start Redis server
sudo service redis-server start

# Install MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# Create a directory for MongoDB data
sudo mkdir -p /data/db
sudo chown -R `id -u`:`id -g` /data/db

# Start MongoDB server
nohup mongod --dbpath /data/db > /dev/null 2>&1 &
