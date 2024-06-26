{
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./apps.nix
    ./darwin-trampolines
    ./nix-core.nix
    ./secrets
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    GOPATH = "$HOME/.go";
    LANG = "en_US.UTF-8";
  };

  home.sessionPath = [
    "$HOME/.krew/bin"
  ];
}
