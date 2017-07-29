#!/bin/bash
cp generated_configs $NODENAME.toml config.toml
./out/parity --config config.toml
