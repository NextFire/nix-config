# nix-config

## macOS Configuration

### Install

```sh
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install Nix
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
# Apply configuration
nix run nix-darwin -- switch --flake .
```

### Update

```sh
nix-channel --update
darwin-rebuild switch --flake .
```

## Dev Shell

```sh
nix registry add local $PWD
nix develop local#<name>
```
