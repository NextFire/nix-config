{ pkgs, inputs, ... }:
let
  inherit (inputs) self;
in
{
  imports = [
    ./apps/aegisub
    ./apps/ansible.nix
    ./apps/fish.nix
    ./apps/git.nix
    ./apps/htop.nix
    ./apps/krew.nix
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
        cargo
        deno
        docker-client
        edgedb
        ffmpeg
        go
        helmfile
        httpie
        imagemagick
        just
        kubectl
        kubernetes-helm
        kustomize
        mediainfo
        meson
        nil
        nixpkgs-fmt
        nodejs_20
        pandoc
        pipx
        pkg-config
        python312
        rustc
        sops
        stern
        tectonic
        tree
        typst
        uv
        wget
        yq
      ];
      customPkgs = with self.packages.${pkgs.system}; [
        amaranth
        cookhand-std-r
      ];
    in
    nixPkgs ++ customPkgs;
}
