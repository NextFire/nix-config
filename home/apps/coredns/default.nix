{ config, ... }:
let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix-config/home/apps/coredns/${path}";
in
{
  home.file.".config/coredns/Corefile".source = link "Corefile";
}
