{ pkgs, ... }: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [ ];

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  programs.fish.enable = true;

  environment = {
    shells = [ pkgs.fish ];
    variables = {
      LANG = "en_US.UTF-8";
      EDITOR = "vim";
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  system.defaults = {
    ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;
    screencapture.disable-shadow = true;
  };
}
