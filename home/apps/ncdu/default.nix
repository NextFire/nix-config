{ pkgs, config, ... }:
let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix-config/home/apps/ncdu/${path}";
in
{
  home.file.".config/ncdu/config".source = link "config";

  home.packages = [ pkgs.ncdu ];
}
