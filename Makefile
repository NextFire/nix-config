.PHONY: nix-install darwin-init darwin-switch hm-init hm-switch update secrets

nix-install:
	curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

darwin-init:
	nix run nix-darwin -- switch --flake .

darwin-switch:
	darwin-rebuild switch --flake .

hm-init:
	nix run home-manager/master -- switch --flake . -b backup

hm-switch:
	home-manager switch --flake . -b backup

update:
	nix flake update

secrets:
	sops -i home/secrets/secrets.sops.yaml
