#!/bin/bash

echo "Downloading lombok binary for Java"
sudo mkdir -p /usr/local/share/lombok
curl https://projectlombok.org/downloads/lombok.jar --output /usr/local/share/lombok/lombok.jar || echo "Download lombok failed"
echo "Download completed"
