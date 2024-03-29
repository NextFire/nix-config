{ inputs, ... }:
let
  inherit (inputs) darwin;
  username = "namvu";
  mkDarwin = hostPlatform: darwin.lib.darwinSystem {
    modules = [
      ./modules/apps.nix
      ./modules/fish-fix.nix
      ./modules/home-manager.nix
      ./modules/nix-core.nix
      ./modules/system.nix
    ];
    specialArgs = { inherit inputs hostPlatform username; };
  };
in
{
  flake = {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#${hostname}
    darwinConfigurations = {
      "MacBook-Pro-de-Nam" = mkDarwin "x86_64-darwin";
    };

    # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
  };
}
