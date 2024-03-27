# nix-config

## macOS Configuration

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

## Dev Shell

```sh
nix registry add local $PWD
nix develop local#<name>
```
