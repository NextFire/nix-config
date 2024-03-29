{ config, ... }:
let
  utils = import ../utils.nix { program = "ssh"; inherit config; };
in
{
  home.file.".ssh".source = utils.linkSecret "";
}
