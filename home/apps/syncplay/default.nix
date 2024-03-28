{ config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file.".config/syncplay.ini".source = utils.linkSecret ./syncplay.ini;
}
