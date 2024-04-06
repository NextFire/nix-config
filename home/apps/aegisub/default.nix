{ pkgs, inputs', lib, ... }:
let
  configDir =
    if pkgs.stdenv.isDarwin then
      "Library/Application Support/Aegisub"
    else
      ".aegisub";
in
{
  # home.packages = lib.mkIf pkgs.stdenv.isLinux [ inputs'.japan7.packages.aegisub ];

  home.file = {
    "${configDir}/hotkey.json".source = ./hotkey.json;
    "${configDir}/catalog".source = ./catalog;
    "${configDir}/automation/autoload/fade.lua".source = ./autoload/fade.lua;
  };
}
