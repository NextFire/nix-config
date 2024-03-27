{ config, ... }:
let
  mkln = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/coredns/${path}";
in
{
  home.file.".config/coredns/Corefile".source = mkln "Corefile";
}
