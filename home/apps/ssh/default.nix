{ config, ... }:
let
  linkSecret = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix-config/secrets/ssh/${path}";
in
{
  home.file.".ssh".source = linkSecret "";
}
