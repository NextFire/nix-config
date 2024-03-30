{ config, ... }: {
  sops.secrets."syncplay/syncplay.ini".path = "${config.xdg.configHome}/syncplay.ini";
}
