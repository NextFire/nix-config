{ config, ... }:
let
  mkln = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/ansible/${path}";
in
{
  home.file.".ansible.cfg".source = mkln ".ansible.cfg";
}
