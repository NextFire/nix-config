init:
    nix run nix-darwin -- switch --flake .

update:
    nix-channel --update
    darwin-rebuild switch --flake .

secrets:
    sops -i home/secrets.sops.yaml
