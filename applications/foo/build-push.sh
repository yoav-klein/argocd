#!/bin/bash

for version in 1.0 2.0 3.0; do
    cd $version
    docker build -t yoavklein3/foo:$version .
    docker push yoavklein3/foo:$version
    cd ..
done
