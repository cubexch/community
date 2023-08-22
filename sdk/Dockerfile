FROM ubuntu:20.04

# set up /etc/tiezone to avoid tzdata interactive installer
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -y
RUN apt-get install apt-utils
RUN apt-get install curl unzip -y

RUN useradd -ms /bin/bash proto
# add protoc-3.15.8
# use ADD to copy the remote file to the docker container, instead of RUN & curl. 
ADD https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh /home/proto/install-nvm.sh
ADD https://github.com/protocolbuffers/protobuf/releases/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip /home/proto/
RUN chown -R proto:proto /home/proto

USER proto
WORKDIR /home/proto
# set up node / npm under proto user
ENV NODE_VERSION=16.13.0
RUN bash install-nvm.sh
ENV NVM_DIR=/home/proto/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/home/proto/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN npm install -g typescript google-protobuf protoc-gen-ts

# set up protoc compiler
RUN unzip protoc-3.15.8-linux-x86_64.zip -d $HOME/.local
RUN export PATH="$PATH:$HOME/.local/bin"

COPY protos/ /home/proto/
RUN mkdir python/ cpp/ java/ javascript/ typescript/

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
# protoc -M --go_out=../go/ ./*.proto


# for c sharp, we need to specify a namespace option in proto files
# and make ../csharp dir
# protoc --csharp_out=../csharp/ *.proto