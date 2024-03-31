{
  flake = {
    overlays = {
      pipx = import ./pipx.nix;
    };
  };
}
