#!/bin/bash

protoc --python_out=../python/ *.proto
protoc --cpp_out=../cpp/ *.proto
protoc --java_out=../java/ *.proto

# generating CommonJS style import, if Closer-style imports are needed
# see: https://github.com/protocolbuffers/protobuf-javascript
protoc --js_out=import_style=commonjs,binary:../javascript *.proto

# requires protoc-gen-ts, see https://github.com/thesayyn/protoc-gen-ts
protoc --ts_out=../typescript/ *.proto



# Golang requires an option to be added to proto
# option go_package in the protos
# see: https://protobuf.dev/getting-started/gotutorial/
# protoc -M --go_out=../go/ ./*.proto


# TODO: for c sharp, we need to specify a namespace in proto
# and make ../csharp dir
# protoc --csharp_out=../csharp/ *.proto