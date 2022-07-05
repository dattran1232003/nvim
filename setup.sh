#!/bin/bash

echo "Downloading lombok binary for Java"
curl https://projectlombok.org/downloads/lombok.jar --output /usr/local/share/lombok/lombok.jar || echo "Download lombok failed"
echo "Download completed"
