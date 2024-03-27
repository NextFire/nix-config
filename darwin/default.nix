{ inputs }:
let
  hostname = "MacBook-Pro-de-Nam";
  hostPlatform = "x86_64-darwin";
in
{
  # Build darwin flake using:
  # $ darwin-rebuild build --flake .#${hostname}
  darwinConfigurations.${hostname} = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      ./modules/nix-core.nix
      ./modules/system.nix
      ./modules/apps.nix
    ];
    specialArgs = { inherit inputs hostname hostPlatform; };
  };

  # Expose the package set, including overlays, for convenience.
  darwinPackages = inputs.self.darwinConfigurations.${hostname}.pkgs;
}