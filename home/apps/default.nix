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
    edgedb
    ffmpeg
    go
    graphviz
    helmfile
    httpie
    imagemagick
    just
    krew
    kubectl
    kustomize
    mediainfo
    meson
    mkcert
    nil
    nixpkgs-fmt
    nodejs
    perl538Packages.LatexIndent
    pipx
    pkg-config
    python3
    rustc
    stern
    tectonic
    tree
    typst
    uv
    wget
    yq
  ];
}
