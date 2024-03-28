{ pkgs, config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file."Library/Application Support/pypoetry/config.toml".source = utils.link ./config.toml;

  home.packages = [ pkgs.poetry ];
}
