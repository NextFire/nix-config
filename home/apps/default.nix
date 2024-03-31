{ pkgs, inputs, self', ... }: {
  nixpkgs.overlays = [
    inputs.fenix.overlays.default
  ];

  imports = [
    ./aegisub
    ./ansible.nix
    ./fish.nix
    ./git.nix
    ./htop.nix
    ./kubectl.nix
    ./mpv.nix
    ./ncdu.nix
    ./poetry.nix
    ./rclone.nix
    ./sops.nix
    ./ssh.nix
    # ./starship.nix
    ./syncplay.nix
    ./yt-dlp.nix
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
        go
        httpie
        imagemagick
        mediainfo
        meson
        nil
        nixpkgs-fmt
        nodejs_20
        pandoc
        (pipx.overrideAttrs (oldAttrs: {
          # FIXME: https://github.com/NixOS/nixpkgs/pull/298528
          disabledTests = oldAttrs.disabledTests ++ [ "test_skip_maintenance" ];
        }))
        pkg-config
        python312
        sops
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
