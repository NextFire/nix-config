{ pkgs, lib, self', ... }:
let
  configDir =
    if pkgs.stdenv.isDarwin then
      "Library/Application Support/Aegisub"
    else
      ".aegisub";
in
{
  home.packages = lib.mkIf pkgs.stdenv.isLinux [ self'.packages.aegisub-japan7 ];

  home.file = {
    "${configDir}/hotkey.json".source = ./hotkey.json;
    "${configDir}/catalog".source = ./catalog;
    "${configDir}/automation/autoload/fade.lua".source = ./autoload/fade.lua;
  };
}
