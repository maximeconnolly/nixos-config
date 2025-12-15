#!/usr/bin/env bash

# Update Flake Inputs
# This script updates the flake.lock file to the latest versions.

set -e

echo "Updating flake inputs..."
sudo nix flake update --commit-lock-file

echo "Flake updated!"
echo "Run ./install.sh to apply the changes to your system."
