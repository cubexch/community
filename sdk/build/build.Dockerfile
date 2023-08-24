FROM cube-protoc-dependencies:v0.1

COPY protos/ /home/proto/
RUN mkdir python/ cpp/ java/ javascript/ typescript/ go/

RUN /home/proto/.local/bin/protoc --python_out=/home/proto/python/ *.proto
RUN /home/proto/.local/bin/protoc --cpp_out=/home/proto/cpp/ *.proto
RUN /home/proto/.local/bin/protoc --java_out=/home/proto/java/ *.proto

# generating CommonJS style import, if Closer-style imports are needed
# see: https://github.com/protocolbuffers/protobuf-javascript
RUN /home/proto/.local/bin/protoc --js_out=import_style=commonjs,binary:/home/proto/javascript *.proto

# requires protoc-gen-ts, see https://github.com/thesayyn/protoc-gen-ts
RUN /home/proto/.local/bin/protoc --ts_out=/home/proto/typescript/ *.proto

# TODO: golang and csharp
# Golang requires an option to be added to proto
# option go_package in the protos
# see: https://protobuf.dev/getting-started/gotutorial/
# for golang generation, ensure $GOPATH is in your path then:
# go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN ls $GOPATH/bin
RUN /home/proto/.local/bin/protoc --go_out=/home/proto/ *.proto

# for c sharp, we need to specify a namespace option in proto files
# and make ../csharp dir
# protoc --csharp_out=../csharp/ *.proto