{ pkgs, config, lib, self', ... }: {
  home.packages = lib.mkIf pkgs.stdenv.isLinux [ self'.packages.syncplay-japan7 ];

  sops.secrets."syncplay/syncplay.ini".path = "${config.xdg.configHome}/syncplay.ini";
}
