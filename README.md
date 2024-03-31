# nix-config

Personal Nix flake configuration for macOS and Linux. It uses flake-parts, nix-darwin, home-manager and sops-nix.

**Requirement:** `~/.nix-config.key.txt` (sops age private key)

## nix-darwin

### Install

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix run nix-darwin -- switch --flake .
```

### Update

```sh
nix-channel --update
darwin-rebuild switch --flake .
```

## Standalone home-manager

### Install

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
nix run home-manager/master -- switch --flake . -b backup
```

### Update

```sh
nix-channel --update
home-manager switch --flake . -b backup
```
