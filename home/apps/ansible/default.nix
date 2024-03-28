{ pkgs, config, ... }:
let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/ansible/${path}";
in
{
  home.file.".ansible.cfg".source = link ".ansible.cfg";

  home.packages = [ pkgs.ansible ];
}
