{ pkgs, inputs, ... }:
let
  inherit (inputs) self;
in
{
  imports = [
    ./programs/aegisub
    ./programs/ansible.nix
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/htop.nix
    ./programs/mpv.nix
    ./programs/ncdu.nix
    ./programs/poetry.nix
    ./programs/rclone.nix
    ./programs/sops.nix
    ./programs/ssh.nix
    # ./programs/starship.nix
    ./programs/syncplay.nix
    ./programs/yt-dlp.nix
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
        krew
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
