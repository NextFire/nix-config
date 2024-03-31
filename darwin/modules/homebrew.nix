{ inputs, system, username, ... }: {
  imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];

  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = (system == "aarch64-darwin");

    # User owning the Homebrew prefix
    user = username;

    # Automatically migrate existing Homebrew installations
    autoMigrate = true;

    # Optional: Enable fully-declarative tap management
    #
    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
    # mutableTaps = false;
  };

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
