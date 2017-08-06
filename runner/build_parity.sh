#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

# Verify AWS tokens
[[  ! -n "$AWS_ACCESS_KEY_ID" || ! -n "AWS_SECRET_ACCESS_KEY" ]] && {
   echo "Please define the apporpriate AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables."
   exit 1
}

DATETIME=$(date +'%Y%m%d')

export AWS_INSTANCE_TYPE=c4.large

set +e 
docker-machine create --driver amazonec2 builder
set -e
eval $(docker-machine env --shell=bash builder)

cd parity
docker build --build-arg DATETIME=${DATETIME} --build-arg RUSTVER=${RUSTVER} -t parity_builder .
mkdir -p out
docker rm parity_builder
docker run --name parity_builder parity_builder
docker cp parity_builder:/parity/target/release/parity ./parity/out/

docker-machine rm -y builder
