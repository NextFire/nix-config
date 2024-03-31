{ system, revision, ... }: {
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Garbage collection (system)
  nix.gc.automatic = true;
  nix.gc.options = "-d";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = revision;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
}
