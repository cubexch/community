#!/bin/bash
# 
# This script build the protobuf generation image in Dockerfile,
# creates a container using the image, copies the various sdks
# to their respective files, deletes the container / image,
# and exits.
#
# it relies upon a dependency container, which is generated using:
# $ docker build -f deps.Dockerfile . -t cube-protoc-dependencies:latest

# build container and generate sdks on build
docker build --file build.Dockerfile . --tag proto-build:latest

# copy files from container to host sdk directory
docker create --name proto-copy proto-build:latest
docker cp proto-copy:/home/proto/cpp/ ../
docker cp proto-copy:/home/proto/java/ ../
docker cp proto-copy:/home/proto/javascript/ ../
docker cp proto-copy:/home/proto/python/ ../
docker cp proto-copy:/home/proto/typescript/ ../
docker cp proto-copy:/home/proto/go/ ../
# docker cp proto-copy:/home/proto/csharp/ csharp/

echo '-------------------------------------'
echo 'library generation complete, cleaning up....'
echo '-------------------------------------'
echo '**** removing proto-copy container'
echo '-------------------------------------'
docker rm --force proto-copy 
echo '-------------------------------------'
echo '**** removing proto-build:latest container'
echo '-------------------------------------'
docker image rm --force proto-build:latest
echo '-------------------------------------'
echo 'COMPLETE: language specific imports created from proto files in protos/ directory'
