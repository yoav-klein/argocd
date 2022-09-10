#!/bin/bash

for version in 1.0 2.0 3.0; do
    cd $version
    docker build -t yoavklein3/baz:$version .
    docker push yoavklein3/baz:$version
    cd ..
done
