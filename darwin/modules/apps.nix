{ pkgs, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    coredns
  ];

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
    taps = [
      "homebrew/cask-fonts"
      "japan7/tap"
    ];
    casks = [
      "aegisub-japan7"
      "chromium"
      "discord"
      "font-amaranth"
      "keka"
      "macfuse"
      "musicbrainz-picard"
      "rancher"
      "spotify"
      "syncplay-japan7"
      "transmission"
      "vagrant"
      "virtualbox"
      "visual-studio-code"
      "vmware-fusion"
    ];
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

  launchd.daemons = {
    coredns = {
      serviceConfig = {
        ProgramArguments = [
          "${pkgs.coredns}/bin/coredns"
          "-conf"
          "/usr/local/etc/coredns/Corefile"
        ];
        RunAtLoad = true;
        StandardOutPath = "/usr/local/var/log/coredns.log";
        StandardErrorPath = "/usr/local/var/log/coredns.log";
      };
    };
  };
}
