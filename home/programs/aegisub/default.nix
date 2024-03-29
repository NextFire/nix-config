{ config, ... }:
let
  utils = import ../../utils.nix { program = "aegisub"; inherit config; };
in
{
  home.file = {
    "Library/Application Support/Aegisub/hotkey.json".source = utils.link ./hotkey.json;

    "Library/Application Support/Aegisub/catalog".source = utils.link ./catalog;

    "Library/Application Support/Aegisub/automation/autoload/fade.lua".source = ./autoload/fade.lua;
  };
}
