{ pkgs, inputs', config, lib, ... }: {
  home.packages = lib.mkIf pkgs.stdenv.isLinux [ inputs'.japan7.packages.syncplay ];

  sops.secrets."syncplay/syncplay.ini".path = "${config.xdg.configHome}/syncplay.ini";
}
