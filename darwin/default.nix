{ inputs, self, ... }:
let
  inherit (inputs) darwin;
  revision = self.rev or self.dirtyRev or null;
in
{
  perSystem = { inputs', self', system, ... }:
    let
      mkDarwin = { username }: darwin.lib.darwinSystem {
        modules = [
          ./modules/apps.nix
          ./modules/fish-fix.nix
          ./modules/home-manager.nix
          ./modules/nix-core.nix
          ./modules/system.nix
        ];
        specialArgs = { inherit inputs inputs' self' system username revision; };
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#${hostname}
      legacyPackages.darwinConfigurations = {
        "MacBook-Pro-de-Nam" = mkDarwin { username = "namvu"; };
      };

      # Expose the package set, including overlays, for convenience.
      # darwinPackages = self.darwinConfigurations.${hostname}.pkgs;
    };
}
