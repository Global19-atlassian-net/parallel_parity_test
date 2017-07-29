#!/bin/bash

docker build -t runner .
mkdir -p shared
docker run --name runner -it --volume $(pwd)/shared:/shared runner bash

