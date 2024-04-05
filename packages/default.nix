{ inputs, ... }:
let
  inherit (inputs) amaranth-src;
in
{
  perSystem = { pkgs, ... }: {
    packages = {
      amaranth = pkgs.callPackage ./fonts/amaranth.nix { inherit amaranth-src; };
      cookhand-std-r = pkgs.callPackage ./fonts/cookhand-std-r { };
    };
  };
}
