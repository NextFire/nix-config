.PHONY: nix-install darwin-init darwin-switch hm-init hm-switch secrets

nix-install:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

darwin-init:
	nix run nix-darwin -- switch --flake .

darwin-switch:
	nix-channel --update
	darwin-rebuild switch --flake .

hm-init:
	nix run home-manager/master -- switch --flake . -b backup

hm-switch:
	nix-channel --update
	home-manager switch --flake . -b backup

secrets:
	sops -i home/secrets.sops.yaml
