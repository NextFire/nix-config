{ inputs }:
let
  allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
  forAllSystems = f: inputs.nixpkgs.lib.genAttrs allSystems (system: f {
    pkgs = import inputs.nixpkgs { inherit system; };
  });
in
{
  devShells = forAllSystems
    ({ pkgs }:
      let
        common = with pkgs; [
          git
        ];

        mkShell = deps: pkgs.mkShell {
          packages = common ++ deps;
        };
      in
      import ./stacks.nix { inherit pkgs mkShell; }
    );
}
