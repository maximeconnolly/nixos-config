#!/usr/bin/env bash

# Apply NixOS Configuration
# This script applies the current flake configuration to the running system.

set -e

echo "Applying NixOS Configuration..."

# using sudo to ensure privileges for system modification
sudo nixos-rebuild switch --flake .#nixos

echo "Configuration applied successfully!"
