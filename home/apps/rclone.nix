{ pkgs, config, ... }: {
  sops.secrets."rclone/rclone.conf".path = "${config.home.homeDirectory}/.config/rclone/rclone.conf";

  home.packages = [ pkgs.rclone ];
}
