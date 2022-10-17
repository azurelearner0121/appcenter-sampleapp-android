#!/usr/bin/env bash

docker pull nginx
rm -rf /var/lib/apt/lists/*
wget -q https://download.qualibrate.com/qualibrate-cli
sudo chmod +x qualibrate-cli
ls -al
sudo ./qualibrate-cli --help
