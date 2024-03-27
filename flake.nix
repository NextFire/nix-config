{
  description = "NextFire's Nix config for macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      hostname = "MacBook-Pro-de-Nam";
      hostPlatform = "x86_64-darwin";
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#${hostname}
      darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
        modules = [
          ./modules/nix-core.nix
          ./modules/system.nix
          ./modules/apps.nix
        ];
        specialArgs = { inherit inputs hostname hostPlatform; };
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
    };
}
