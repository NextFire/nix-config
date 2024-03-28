{ config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file = {
    "Library/Application Support/Aegisub/automation".source = utils.link ./automation;
    "Library/Application Support/Aegisub/catalog".source = utils.link ./catalog;
    "Library/Application Support/Aegisub/hotkey.json".source = utils.link ./hotkey.json;
  };
}
