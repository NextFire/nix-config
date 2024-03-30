{ lib, config, ... }: {
  xdg.configFile."git/allowed_signers".text = lib.concatMapStrings (x: x + "\n") [
    "git@yuru.moe ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAf0XdYYcV+eqm/IKre3xJlcZNtHTdiD8aDfb6U4+eNd namvu@MacBook-Pro-de-Nam.local"
    "git@yuru.moe ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPByPvY+EQBd98iuNBXk1MT1w2TzKbF/kvNbIQRB1sh2 root@camp"
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    userEmail = "git@yuru.moe";
    userName = "NextFire";
    signing.key = "~/.ssh/id_ed25519.pub";
    extraConfig = {
      core = { autocrlf = "input"; };
      gpg = {
        format = "ssh";
        ssh = { allowedSignersFile = "${config.xdg.configHome}/git/allowed_signers"; };
      };
      init = { defaultBranch = "main"; };
      fetch = { prune = true; };
      pull = { rebase = true; };
      commit = { gpgSign = true; };
      push = { autoSetupRemote = true; };
      rebase = {
        autosquash = true;
        autostash = true;
      };
      diff = { tool = "default-difftool"; };
      difftool = {
        "default-difftool" = { cmd = "code --wait --diff $LOCAL $REMOTE"; };
      };
      merge = {
        tool = "code";
        conflictstyle = "zdiff3";
        ff = false;
      };
      mergetool = {
        "code" = { cmd = "code --wait --merge $REMOTE $LOCAL $BASE $MERGED"; };
      };
      rerere = { enabled = true; };
    };
    ignores = [
      # https://github.com/github/gitignore/blob/4488915eec0b3a45b5c63ead28f286819c0917de/Global/macOS.gitignore
      # General
      ".DS_Store"
      ".AppleDouble"
      ".LSOverride"

      # Icon must end with two \r
      "Icon"

      # Thumbnails
      "._*"

      # Files that might appear in the root of a volume
      ".DocumentRevisions-V100"
      ".fseventsd"
      ".Spotlight-V100"
      ".TemporaryItems"
      ".Trashes"
      ".VolumeIcon.icns"
      ".com.apple.timemachine.donotpresent"

      # Directories potentially created on remote AFP share
      ".AppleDB"
      ".AppleDesktop"
      "Network Trash Folder"
      "Temporary Items"
      ".apdisk"

      # direnv
      ".direnv"
      ".envrc"
    ];
  };
}
