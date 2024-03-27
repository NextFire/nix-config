{ config, ... }:
let
  mkln = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/ansible/${path}";
in
{
  home.file."Library/Fonts/WIX-CookHandStd-R.otf".source = mkln "WIX-CookHandStd-R.otf";
}
