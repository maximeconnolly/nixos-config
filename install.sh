#!/usr/bin/env bash

# Apply NixOS Configuration
# This script applies the current flake configuration to the running system.
# Usage: ./install.sh [hostname]
# Default to system hostname

set -e

# Default to system hostname if no argument is provided
HOST=${1:-$(hostname)}

if [ -z "$HOST" ]; then
    echo "Error: Could not determine hostname. Please provide it as an argument."
    exit 1
fi

echo "Applying NixOS Configuration for host: $HOST..."

# using sudo to ensure privileges for system modification
sudo nixos-rebuild switch --flake .#$HOST

echo "Configuration applied successfully!"
