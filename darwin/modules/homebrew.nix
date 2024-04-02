{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    taps = [
      "japan7/tap"
    ];
    casks = [
      "aegisub-japan7"
      "chromium"
      "discord"
      "keka"
      "macfuse"
      "mpv"
      "musicbrainz-picard"
      "rancher"
      "spotify"
      "syncplay-japan7"
      "transmission"
      "vagrant"
      "virtualbox"
      "visual-studio-code"
    ];
    caskArgs.no_quarantine = true;
    masApps = {
      "AdGuard for Safari" = 1440147259;
      "Bitwarden" = 1352778147;
      "GarageBand" = 682658836;
      "Goodnotes" = 1444383602;
      "iMovie" = 408981434;
      "Keynote" = 409183694;
      "Noir" = 1592917505;
      "Numbers" = 409203825;
      "Pages" = 409201541;
      "Refined GitHub" = 1519867270;
      "Userscripts-Mac-App" = 1463298887;
      "WireGuard" = 1451685025;
    };
  };
}
