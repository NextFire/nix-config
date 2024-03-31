{ inputs, self, ... }: {
  perSystem = { inputs', self', system, ... }:
    let
      mkDarwin = { username }: inputs.darwin.lib.darwinSystem {
        modules = [
          ./fish-fix.nix
          ./home-manager.nix
          ./homebrew.nix
          ./nix-core.nix
          ./system.nix
        ];
        specialArgs = {
          inherit inputs inputs' self' system username;
          revision = self.rev or self.dirtyRev or null;
        };
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
