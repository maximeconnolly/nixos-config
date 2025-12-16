# Agent Context

This file maintains context for the AI agent working on this repository.

## Project Overview
- **Type**: NixOS Configuration (Flake-based)
- **Repo**: `nixos-config`
- **Primary User**: `mconnolly`

## Infrastructure
- **Hosts**:
  - `nixos`: Virtual Machine
  - `msi-laptop`: MSI Laptop
- **Secret Management**: [Agenix](https://github.com/ryantm/agenix)
  - Secrets file: `secrets/secrets.nix`
  - Key location: `keys/id_ed25519.pub` (automatically authorized)

## installed Tools & Features
### Security / Pentesting
- **Tools**: `metasploit`, `burpsuite`, `ghidra`, `claude-code`, `zsteg`, `steghide`, `stegsolve`, `binwalk`, `htop`
- **Location**: `modules/system.nix` (System packages)

### Infrastructure & Automation
- **Docker**: Enabled (`virtualisation.docker`), user in `docker` group.
- **Ansible**: Installed via system packages.

### Productivity
- **Obsidian**: Installed via Home Manager (`home/programs/common.nix`).

## Configuration Conventions
- **System-wide Config**: `modules/system.nix`
- **User-specific Config**: `home/` (Home Manager)
- **Secrets Encryption**: Encrypted with user SSH key. Host keys should be added for boot decryption on physical hardware.

## Recent Changes
- Configured Agenix for `nixos` and `msi-laptop`.
- Added SSH public key auto-authorization.
- Installed security tool suite.
- Enabled Docker.
- Added Ansible and Obsidian.
