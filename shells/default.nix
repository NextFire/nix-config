{
  perSystem = { pkgs, ... }:
    let
      common = with pkgs; [ ];
      mkShell = deps: pkgs.mkShell { packages = common ++ deps; };
    in
    {
      devShells = import ./stacks.nix { inherit pkgs mkShell; };
    };
}
