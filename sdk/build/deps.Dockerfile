FROM ubuntu:20.04

# set up /etc/tiezone to avoid tzdata interactive installer
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get upgrade -y
RUN apt-get install apt-utils
RUN apt-get install curl unzip -y

RUN useradd -ms /bin/bash proto
# add protoc-3.15.8, nvm v0.39.0, go1.21.0
ADD https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh /home/proto/install-nvm.sh
ADD https://github.com/protocolbuffers/protobuf/releases/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip /home/proto/
ADD https://dl.google.com/go/go1.21.0.linux-amd64.tar.gz  /home/proto/
RUN chown -R proto:proto /home/proto

USER proto
WORKDIR /home/proto

# set up protoc compiler
RUN unzip protoc-3.15.8-linux-x86_64.zip -d $HOME/.local > /dev/null
ENV PATH="${PATH}:/home/proto/.local/bin"

# set up node / npm under proto user
ENV NODE_VERSION=16.13.0
RUN bash install-nvm.sh
ENV NVM_DIR=/home/proto/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/home/proto/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN npm install -g typescript google-protobuf protoc-gen-ts


# set up golang for user & install golang protoc package
RUN tar -C $HOME/.local -xzf $HOME/go1.21.0.linux-amd64.tar.gz
ENV GOROOT="/home/proto/.local/go"
ENV GOPATH="${GOROOT}/bin"
ENV PATH="${PATH}:/home/proto/.local/go/bin:$GOPATH/bin"
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest