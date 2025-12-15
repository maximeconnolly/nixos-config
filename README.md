# NixOS Configuration

This repository contains the NixOS configuration for my personal systems, managed as a [Nix Flake](https://nixos.wiki/wiki/Flakes).

## Hosts

*   **nixos**: A VM configuration.
*   **msi-laptop**: Configuration for the MSI laptop.

## Features

*   **Flake-based**: Reproducible system configurations.
*   **Agenix**: Secret management using `age` encryption.
*   **SSH Key Management**: User public keys are stored in `keys/` and automatically authorized.

## Usage

### Installation

Clone the repository:

```bash
git clone git@github.com:maximeconnolly/nixos-config.git
cd nixos-config
```

### Apply Configuration

To apply the configuration for the current host (if hostname matches):

```bash
sudo nixos-rebuild switch --flake .
```

To apply a specific host configuration (e.g., `nixos`):

```bash
sudo nixos-rebuild switch --flake .#nixos
```

## Secrets Management (Agenix)

Secrets are encrypted using [Agenix](https://github.com/ryantm/agenix).

### Adding a new secret

1.  Add the secret definition to `secrets/secrets.nix`.
2.  Create/Edit the secret file:
    ```bash
    agenix -e secrets/my-secret.age
    ```
3.  Reference the secret in your NixOS module:
    ```nix
    age.secrets.my-secret.file = ../secrets/my-secret.age;
    ```

### Public Keys

*   User SSH keys are stored in `keys/`.
*   These keys are used for Agenix encryption/decryption and are automatically added to `authorized_keys`.
