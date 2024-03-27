{ config, ... }:
let
  mkln = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/aegisub/${path}";
in
{
  home.file = {
    "Library/Application Support/Aegisub/automation".source = mkln "automation";
    "Library/Application Support/Aegisub/catalog".source = mkln "catalog";
    "Library/Application Support/Aegisub/hotkey.json".source = mkln "hotkey.json";
  };
}
