{
  perSystem = { self', pkgs, ... }:
    let
      attrs = pkgs // { inherit self'; };
    in
    {
      packages = {
        amaranth = import ./fonts/amaranth.nix attrs;
        cookhand-std-r = import ./fonts/cookhand-std-r attrs;
      };
    };
}
