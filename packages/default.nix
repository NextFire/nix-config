{
  perSystem = { pkgs, ... }: {
    packages = {
      amaranth = import ./fonts/amaranth.nix pkgs;
      cookhand-std-r = import ./fonts/cookhand-std-r pkgs;
      syncplay-japan7 = import ./japan7/syncplay.nix pkgs;
    };
  };
}
