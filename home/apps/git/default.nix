{ config, ... }:
let
  mkln = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/apps/git/${path}";
in
{
  home.file.".config/git/allowed_signers".source = mkln "allowed_signers";

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
        ssh = { allowedSignersFile = "~/.config/git/allowed_signers"; };
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
      url = {
        "git@github.com:" = { insteadOf = "https://github.com/"; };
      };
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
    ];
  };
}
