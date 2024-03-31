{ pkgs, config, lib, ... }: {
  home.packages = lib.mkIf pkgs.stdenv.isLinux (with pkgs; [ syncplay ]);

  sops.secrets."syncplay/syncplay.ini".path = "${config.xdg.configHome}/syncplay.ini";
}
