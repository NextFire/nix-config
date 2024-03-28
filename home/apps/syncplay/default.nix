{ config, ... }:
let
  linkSecret = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/secrets/syncplay/${path}";
in
{
  home.file.".config/syncplay.ini".source = linkSecret "syncplay.ini";
}
