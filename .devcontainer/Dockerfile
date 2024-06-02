# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Install MongoDB
RUN apt-get update && apt-get install -y mongodb

# Install Redis
RUN apt-get install -y redis-server

# Start MongoDB and Redis services
CMD service mongodb start && service redis-server start && python3 your_script.py
