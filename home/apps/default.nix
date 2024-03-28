{ pkgs, ... }: {
  imports = [
    ./aegisub
    ./ansible
    ./fish
    ./fonts
    ./git
    ./htop
    ./mpv
    ./ncdu
    ./poetry
    ./rclone
    ./sops
    ./ssh
    # ./starship
    ./syncplay
    ./yt-dlp
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
  home.packages = with pkgs; [
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
}
