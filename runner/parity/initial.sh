#!/bin/bash

echo "Running initial..."

set -e
cd /parity

# Some last minute per-node setup
cp generated_configs/$NODENAME/* .

./out/parity --config initial-config.toml
