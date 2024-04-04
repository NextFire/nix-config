{
  perSystem = { pkgs, ... }: {
    packages = {
      amaranth = pkgs.callPackage ./fonts/amaranth.nix { };
      cookhand-std-r = pkgs.callPackage ./fonts/cookhand-std-r { };
    };
  };
}
