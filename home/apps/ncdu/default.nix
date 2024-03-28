{ pkgs, config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file.".config/ncdu/config".source = utils.link ./config;

  home.packages = [ pkgs.ncdu ];
}
