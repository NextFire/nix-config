{ inputs, ... }: {
  perSystem = { pkgs, inputs', self', ... }:
    let
      mkHome = { username, homeDirectory }: inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          {
            # Home Manager needs a bit of information about you and the paths it should
            # manage.
            home = { inherit username homeDirectory; };
          }
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit inputs inputs' self'; };
      };
    in
    {
      legacyPackages.homeConfigurations = {
        "vagrant" = mkHome rec { username = "vagrant"; homeDirectory = "/home/${username}"; };
      };
    };
}
