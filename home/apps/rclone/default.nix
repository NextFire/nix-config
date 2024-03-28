{ pkgs, config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file.".config/rclone/rclone.conf".source = utils.linkSecret ./rclone.conf;

  home.packages = [ pkgs.rclone ];
}
