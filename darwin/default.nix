{ inputs }:
let
  hostname = "MacBook-Pro-de-Nam";
  hostPlatform = "x86_64-darwin";
  username = "namvu";
  inherit (inputs) self darwin;
in
{
  # Build darwin flake using:
  # $ darwin-rebuild build --flake .#${hostname}
  darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
    modules = [
      ./modules/apps.nix
      ./modules/fish-fix.nix
      ./modules/home-manager.nix
      ./modules/nix-core.nix
      ./modules/system.nix
    ];
    specialArgs = { inherit inputs hostname hostPlatform username; };
  };

  # Expose the package set, including overlays, for convenience.
  darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
}
