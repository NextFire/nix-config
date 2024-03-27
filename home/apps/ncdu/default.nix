{ pkgs, config, ... }:
let
  mkln = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/ncdu/${path}";
in
{
  home.file.".config/ncdu/config".source = mkln "config";

  home.packages = [ pkgs.ncdu ];
}
