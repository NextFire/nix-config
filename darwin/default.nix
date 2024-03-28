{ inputs }:
let
  hostname = "MacBook-Pro-de-Nam";
  hostPlatform = "x86_64-darwin";
  username = "namvu";
in
{
  # Build darwin flake using:
  # $ darwin-rebuild build --flake .#${hostname}
  darwinConfigurations.${hostname} = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      ./modules/apps.nix
      ./modules/home-manager.nix
      ./modules/nix-core.nix
      ./modules/system.nix
    ];
    specialArgs = { inherit inputs hostname hostPlatform username; };
  };

  # Expose the package set, including overlays, for convenience.
  darwinPackages = inputs.self.darwinConfigurations.${hostname}.pkgs;
}
