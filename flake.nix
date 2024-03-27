{
  description = "NextFire's Nix config for macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      configuration = { pkgs, ... }: {
        # List packages installed in system profile. To search by name, run:
        # $ nix-env -qaP | grep wget
        environment.systemPackages =
          [
            pkgs.age
            pkgs.cargo
            pkgs.coredns
            pkgs.deno
            pkgs.edgedb
            pkgs.ffmpeg
            pkgs.fzf
            pkgs.gallery-dl
            pkgs.git-lfs
            pkgs.go
            pkgs.graphviz
            pkgs.helmfile
            pkgs.htop
            pkgs.httpie
            pkgs.imagemagick
            pkgs.irssi
            pkgs.jq
            pkgs.krew
            pkgs.kustomize
            pkgs.mediainfo
            pkgs.meson
            pkgs.mkcert
            pkgs.ncdu
            pkgs.nil
            pkgs.nixpkgs-fmt
            pkgs.nodejs
            pkgs.perl538Packages.LatexIndent
            pkgs.pipx
            pkgs.pkg-config
            pkgs.poetry
            pkgs.python3
            pkgs.ranger
            pkgs.rclone
            pkgs.rustc
            pkgs.sops
            pkgs.stern
            pkgs.tectonic
            pkgs.tree
            pkgs.typst
            pkgs.uv
            pkgs.wget
            pkgs.yq
            pkgs.yt-dlp
          ];

        # Auto upgrade nix package and the daemon service.
        services.nix-daemon.enable = true;
        nix.package = pkgs.nix;

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Create /etc/zshrc that loads the nix-darwin environment.
        programs.zsh.enable = true; # default shell on catalina
        programs.fish.enable = true;

        # Set Git commit hash for darwin-version.
        system.configurationRevision = self.rev or self.dirtyRev or null;

        # Used for backwards compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 4;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "x86_64-darwin";

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
            "mpv"
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

        imports = [
          ./fish-fix.nix
        ];

        environment.shells = [ pkgs.fish ];

        security.pam.enableSudoTouchIdAuth = true;
      };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#MacBook-Pro-de-Nam
      darwinConfigurations."MacBook-Pro-de-Nam" = nix-darwin.lib.darwinSystem {
        modules = [ configuration ];
      };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."MacBook-Pro-de-Nam".pkgs;
    };
}
