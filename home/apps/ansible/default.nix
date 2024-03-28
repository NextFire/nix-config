{ pkgs, config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file.".ansible.cfg".source = utils.link ./.ansible.cfg;

  home.packages = [ pkgs.ansible ];
}
