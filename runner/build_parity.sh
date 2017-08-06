#!/bin/bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
./update.sh

source ./globals.sh

# Verify AWS tokens
# [[  ! -n "$AWS_ACCESS_KEY_ID" || ! -n "AWS_SECRET_ACCESS_KEY" ]] && {
#    echo "Please define the apporpriate AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables."
#    exit 1
# }

export DATETIME=$(date +'%Y%m%d%H%M')

export AWS_INSTANCE_TYPE=c4.large

set +e 
# docker-machine create --driver amazonec2 builder
set -e
# eval $(docker-machine env --shell=bash builder)

# cd parity
# docker build --build-arg DATETIME=${DATETIME} --build-arg RUSTVER=${RUSTVER} -t parity_builder .
# mkdir -p out
# set +e
# docker rm parity_builder
# sleep 5
# docker run --name parity_builder parity_builder
# sleep 10
# set -e
# docker cp parity_builder:/parity/target/release/parity ./parity/out/

cd parity
docker-compose -p parity -f docker-compose-build.yml build --build-arg DATETIME=${DATETIME} --build-arg RUSTVER=${RUSTVER} parity_builder
docker-compose -p parity -f docker-compose-build.yml up

docker cp parity_parity_builder_1:/parity/target/release/parity ./out/

# docker-machine rm -y builder
