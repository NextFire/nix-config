{ inputs, self, ... }: {
  perSystem = args@{ pkgs, system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays = [
        inputs.fenix.overlays.default
        self.overlays.default
      ];
    };

    devShells = import ./devshells.nix args;
  };
}
