{ config, ... }: {
  sops.secrets."syncplay/syncplay.ini".path = "${config.home.homeDirectory}/.config/syncplay.ini";
}
