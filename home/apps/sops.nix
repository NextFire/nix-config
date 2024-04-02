{ pkgs, config, ... }:
let
  configDir =
    if pkgs.stdenv.isDarwin then
      "${config.home.homeDirectory}/Library/Application Support/sops"
    else
      "${config.xdg.configHome}/sops";
in
{
  home.packages = with pkgs; [ age sops ];

  sops.secrets."sops_/keys.txt".path = "${configDir}/age/keys.txt";
}
