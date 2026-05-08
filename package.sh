#!/bin/bash

DIR=$(dirname $(readlink -f $0))
VERSION=$(cat $DIR/info.json | jq -r '.version')
NAME=$(cat $DIR/info.json | jq -r '.name')
rm -r $DIR/Build/$NAME\_$VERSION
mkdir -p $DIR/Build/$NAME\_$VERSION
for file in $DIR/*; do
    if [[ $file != *package.sh* && $file != *Build* && $file != *README.md* ]]; then
        cp -R $file $DIR/Build/$NAME\_$VERSION/
    fi
done
