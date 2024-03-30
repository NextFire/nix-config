{ pkgs, config, ... }: {
  sops.secrets."rclone/rclone.conf".path = "${config.xdg.configHome}/rclone/rclone.conf";

  home.packages = [ pkgs.rclone ];
}
