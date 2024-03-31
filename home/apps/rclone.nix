{ pkgs, config, ... }: {
  home.packages = with pkgs; [ rclone ];

  sops.secrets."rclone/rclone.conf".path = "${config.xdg.configHome}/rclone/rclone.conf";
}
