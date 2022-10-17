#!/usr/bin/env bash

#apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
wget -q https://download.qualibrate.com/qualibrate-cli
sudo chmod +x qualibrate-cli
ls -al
sudo ./qualibrate-cli --help
