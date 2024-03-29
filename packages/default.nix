{
  perSystem = { pkgs, ... }: {
    packages.amaranth = import ./fonts/amaranth.nix pkgs;
    packages.cookhand-std-r = import ./fonts/cookhand-std-r pkgs;
  };
}
