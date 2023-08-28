#!/bin/bash

# this script checks the protos in this repository against 
# the protos released by the development team
#
# ******
# NOTE: for now, manually download protos to protos/ for
# the functionality of this script to work. after docs are
# publicly released, work wget functionality in
# ******

set -e
run_generate=false
proto_files=("protos/market_data.proto" "protos/trade.proto")

# TODO: upon release publicly of docs, use wget.
# download most recent protos, because sha256sum files exist we can
# just download to protos folder.
# wget https://docs.cube.exchange/sdk/market_data.proto -O protos/market_data.proto
# wget https://docs.cube.exchange/sdk/trade.proto -O protos/trade.proto

# compare sha1 hash of protos/*.proto to newly downloaded protos
# shasum 
for file in "${proto_files[@]}"
do
    if [[ -s $file.sha256 ]]; then
        if ! sha256sum --check "$file.sha256"; then
            echo "stored hash for '$file' does not match existing file, storing new hash"
            # overwrite sha256sum of file
            sha256sum "$file" > "$file.sha256"
            run_generate=true
        else
            : # hash file exists and matches existing file, do nothing
            echo "remote protos match local protos, no changes needed"
        fi
    else
        echo "no stored hash for '$file', creating hash file"
        sha256sum "$file" > "$file.sha256"
    fi
done

# if run_generate bool has been set to true
if $run_generate; then
    bash generate.sh
fi