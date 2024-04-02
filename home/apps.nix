{ pkgs, self, self', ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    self.overlays.default
  ];

  imports = [
    ./apps/aegisub
    ./apps/ansible.nix
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
        corepack
        deno
        docker-client
        ffmpeg
        httpie
        imagemagick
        mediainfo
        nil
        nixpkgs-fmt
        nodejs
        pipx
        python312
        tree
        typst
        uv
        wget
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
