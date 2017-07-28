#!/bin/bash

sudo docker build -t runner .
mkdir -p shared
sudo docker run --name runner -it --volume $(pwd)/shared:/shared runner bash

