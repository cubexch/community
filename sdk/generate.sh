#!/bin/bash
# 
# This script build the protobuf generation image in Dockerfile,
# creates a container using the image, copies the various sdks
# to their respective files, deletes the container / image,
# and exits.
#
# only requirement is docker

# build container and generate sdks on build
docker build -f Dockerfile . -t proto-gen:latest

# copy files from container to host sdk directory
docker create --name proto-copy proto-gen:latest
docker cp proto-copy:/home/proto/cpp/ ./
docker cp proto-copy:/home/proto/java/ ./
docker cp proto-copy:/home/proto/javascript/ ./
docker cp proto-copy:/home/proto/python/ ./
docker cp proto-copy:/home/proto/typescript/ ./
# docker cp proto-copy:/home/proto/go/ go/
# docker cp proto-copy:/home/proto/csharp/ csharp/

docker rm -f proto-copy 
docker image rm proto-gen:latest
clear
echo 'language specific imports created from proto files in protos/ directory'
