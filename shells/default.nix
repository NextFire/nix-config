{ inputs, self, ... }: {
  perSystem = args@{ pkgs, system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        inputs.fenix.overlays.default
        self.overlays.default
      ];
    };

    devShells = import ./devshells.nix args;
  };

  flake = {
    templates.devshell = {
      path = ./template;
      description = "Nix dev shell template";
    };
  };
}
