# nix-config

Personal Nix configuration for macOS and Linux. It uses flake-parts, nix-darwin, home-manager and sops-nix.

## Prerequisites

- A Nix install with flakes enabled, e.g. via Determinate Systems Nix installer:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

- sops age private key at `~/.nix-config.key.txt` to decrypt home secrets.

## nix-darwin (+ home-manager)

### Install

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
nix run nix-darwin -- switch --flake .
```

### Update

```sh
nix flake update
darwin-rebuild switch --flake .
```

## Standalone home-manager

### Install

```sh
nix run home-manager/master -- switch --flake . -b backup
```

### Update

```sh
nix flake update
home-manager switch --flake . -b backup
```

## Nix dev shells

```sh
nix develop .#<shell>
```
