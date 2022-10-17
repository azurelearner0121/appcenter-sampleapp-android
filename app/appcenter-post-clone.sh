#!/usr/bin/env bash

#apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
wget -q https://download.qualibrate.com/qualibrate-cli
ls
chmod +x qualibrate-cli
./qualibrate-cli help
