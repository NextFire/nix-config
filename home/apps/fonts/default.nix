{ config, ... }:
let
  link = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.nix-config/home/apps/ansible/${path}";
in
{
  home.file."Library/Fonts/WIX-CookHandStd-R.otf".source = link "WIX-CookHandStd-R.otf";
}
