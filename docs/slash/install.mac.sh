#!/bin/bash
set -e

# Acquire sudo upfront
sudo -v

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then ARCH="amd64";
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then ARCH="arm64"; fi

BINARY_URL="https://ytw0728.github.io/docs/slash/clis/v1.0.0/s-${OS}-${ARCH}"

curl -fSL "$BINARY_URL" -o /tmp/s-binary
sudo mv /tmp/s-binary /usr/local/bin/s
sudo chmod +x /usr/local/bin/s

echo "Done! 's' is installed."
s --help
