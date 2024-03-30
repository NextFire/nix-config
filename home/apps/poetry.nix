{ pkgs, config, ... }:
let
  configDir =
    if pkgs.stdenv.isDarwin then
      "Library/Application Support/pypoetry"
    else
      "${config.xdg.configHome}/pypoetry";
in
{
  home.file."${configDir}/config.toml".text = ''
    [virtualenvs]
    in-project = true
  '';

  home.packages = [ pkgs.poetry ];
}
