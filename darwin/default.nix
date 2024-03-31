{ inputs, self, ... }: {
  systems = [ "aarch64-darwin" "x86_64-darwin" ];
  perSystem = { inputs', self', system, ... }:
    let
      mkDarwin = { username }: inputs.darwin.lib.darwinSystem {
        modules = [
          ./modules/fish-fix.nix
          ./modules/home-manager.nix
          ./modules/homebrew.nix
          ./modules/nix-core.nix
          ./modules/system.nix
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
