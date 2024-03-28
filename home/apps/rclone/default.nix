{ pkgs, config, ... }:
let
  linkSecret = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/secrets/rclone/${path}";
in
{
  home.file.".config/rclone/rclone.conf".source = linkSecret "rclone.conf";

  home.packages = [ pkgs.rclone ];
}
