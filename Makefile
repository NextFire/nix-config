.PHONY: darwin-init darwin-switch hm-init hm-switch secrets

darwin-init:
	nix run nix-darwin -- switch --flake .

darwin-switch:
	nix-channel --update
	darwin-rebuild switch --flake .

hm-init:
	nix run home-manager/master -- switch --flake .

hm-switch:
	nix-channel --update
	home-manager switch --flake .

secrets:
	sops -i home/secrets.sops.yaml
