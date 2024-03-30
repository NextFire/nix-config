# nix-config

**Requirement:** `~/.nix-config.key.txt`

## nix-darwin

### Install

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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
nix run home-manager/master -- switch --flake .
```

### Update

```sh
nix-channel --update
home-manager switch --flake .
```

## Dev Shell

```sh
nix registry add local <repo>
nix develop local#<name>
```
