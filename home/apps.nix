{ pkgs, inputs, self, self', ... }: {
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
    self.overlays.japan7
    self.overlays.pipx
  ];

  imports = [
    ./apps/aegisub
    ./apps/ansible.nix
    ./apps/bash.nix
    ./apps/fish.nix
    ./apps/git.nix
    ./apps/htop.nix
    ./apps/kubectl.nix
    ./apps/mpv.nix
    ./apps/ncdu.nix
    ./apps/poetry.nix
    ./apps/rclone.nix
    ./apps/sops.nix
    ./apps/ssh.nix
    # ./apps/starship.nix
    ./apps/syncplay.nix
    ./apps/yt-dlp.nix
  ];

  programs = {
    direnv = { enable = true; };
    fzf = { enable = true; };
    gallery-dl = { enable = true; };
    irssi = { enable = true; };
    jq = { enable = true; };
    ranger = { enable = true; };
  };

  # Packages that should be installed to the user profile.
  home.packages =
    let
      nixPkgs = with pkgs; [
        age
        deno
        docker-client
        edgedb
        fenix.stable.minimalToolchain
        ffmpeg
        gnumake
        go
        httpie
        imagemagick
        mediainfo
        meson
        nil
        nixpkgs-fmt
        nodejs_20
        pandoc
        pipx
        pkg-config
        python312
        tectonic
        tree
        typst
        uv
        wget
        yq
      ];
      selfPkgs = with self'.packages; [
        amaranth
        cookhand-std-r
      ];
      otherPkgs = [
      ];
    in
    nixPkgs ++ selfPkgs ++ otherPkgs;
}
