## Cube SDKS

In this directory you will find SDKs for a variety of languages, generated from protobufs using protoc. You can find the protos and the script used to generate each of the individual languages files in the `protos/`` directory.  

#### Build Requirements:
To build new libraries from the protos in build/protos/:
- install docker
- generate dependency container
    - `$ docker build -f deps.Dockerfile . -t cube-protoc-dependencies:latest`
- run generate.sh from within the build directory
    - `$ cd build/ && bash generate.sh`

#### Resources:
Individual Documentation on protobufs:
- [cpp](https://protobuf.dev/getting-started/cpptutorial/)
- [java](https://protobuf.dev/getting-started/javatutorial/)
- [python](https://protobuf.dev/getting-started/pythontutorial/)
- [javascript](https://github.com/protocolbuffers/protobuf-javascript)
- [typescript](https://github.com/thesayyn/protoc-gen-ts)
- [golang](https://protobuf.dev/getting-started/gotutorial/)

# TODO:
- csharp build