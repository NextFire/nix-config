{ config, ... }:
let
  utils = import ../../utils.nix { appDir = ./.; inherit config; };
in
{
  home.file."Library/Fonts/WIX-CookHandStd-R.otf".source = utils.link ./WIX-CookHandStd-R.otf;
}
