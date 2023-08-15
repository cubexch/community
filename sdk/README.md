## Protobuf SDKS

In this directory you will find SDKs for a variety of languages, generated from protobufs using protoc. You can find the protos and the script used to generate each of the individual languages files in the protos/ directory.  

####
Build Requirements:
```
# protoc install for apt based systems
apt install -y protobuf-compiler

# on non-apt based linux, see: https://github.com/google/protobuf/releases and ensure proper protoc build for your environment
# PB_REL="https://github.com/protocolbuffers/protobuf/releases"
# curl -LO $PB_REL/download/v3.15.8/protoc-3.15.8-linux-x86_64.zip
# unzip protoc-3.15.8-linux-x86_64.zip -d $HOME/.local
# export PATH="$PATH:$HOME/.local/bin"

# on mac:
# brew install protobuf

# language specific tools:

# for typescript library generation
npm install -g protoc-gen-ts

# for golang generation, ensure $GOPATH is in your path
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
```

Individual Documentation on protobufs:
- [cpp](https://protobuf.dev/getting-started/cpptutorial/)
- [java](https://protobuf.dev/getting-started/javatutorial/)
- [python](https://protobuf.dev/getting-started/pythontutorial/)
- [javascript](https://github.com/protocolbuffers/protobuf-javascript)
- [typescript](https://github.com/thesayyn/protoc-gen-ts)
- [golang](https://protobuf.dev/getting-started/gotutorial/)


# TODO:
- golang build
- csharp build
- Create build docker container 