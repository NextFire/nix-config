{ inputs, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
    ./pipx.nix
  ];
}
