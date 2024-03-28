{ config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file.".ssh".source = utils.linkSecret "";
}
