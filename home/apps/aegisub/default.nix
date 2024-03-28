{ config, ... }:
let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix-config/home/apps/aegisub/${path}";
in
{
  home.file = {
    "Library/Application Support/Aegisub/automation".source = link "automation";
    "Library/Application Support/Aegisub/catalog".source = link "catalog";
    "Library/Application Support/Aegisub/hotkey.json".source = link "hotkey.json";
  };
}
