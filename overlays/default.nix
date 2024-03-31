{
  flake = {
    overlays = {
      japan7 = import ./japan7.nix;
      pipx = import ./pipx.nix;
    };
  };
}
