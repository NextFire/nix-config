{ pkgs, config, ... }:
let
  mkln = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/poetry/${path}";
in
{
  home.file."Library/Application Support/pypoetry/config.toml".source = mkln "config.toml";

  home.packages = [ pkgs.poetry ];
}
