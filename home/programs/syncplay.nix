{ config, ... }:
let
  utils = import ../utils.nix { program = "syncplay"; inherit config; };
in
{
  home.file.".config/syncplay.ini".source = utils.linkSecret ./syncplay.ini;
}
