#!/bin/bash

echo "Running prod..."

set -e
cd /parity

echo "The current time is $(date +%s)"
./out/parity --config config.toml --logging=engine=info
