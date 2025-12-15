#!/usr/bin/env bash

# Apply NixOS Configuration
# This script applies the current flake configuration to the running system.
# Usage: ./install.sh [hostname]
# Default hostname is 'nixos'

set -e

# Default to 'nixos' if no argument is provided
HOST=${1:-nixos}

echo "Applying NixOS Configuration for host: $HOST..."

# using sudo to ensure privileges for system modification
sudo nixos-rebuild switch --flake .#$HOST

echo "Configuration applied successfully!"
