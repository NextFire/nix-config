{ config, ... }:
let
  linkSecret = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/secrets/fish/${path}";
in
{
  home.file.".config/fish/functions/hikari.fish".source = linkSecret "hikari.fish";

  programs.fish = {
    enable = true;
    loginShellInit =
      ''
        # set -x JAVA_HOME (/usr/libexec/java_home)
        set -x GOPATH ~/.go
        fish_add_path -P ~/.local/bin
        fish_add_path -aP ~/.krew/bin ~/.rd/bin
      '';
    shellAbbrs = {
      uvp = "uv pip";
      uvv = "uv venv";
      activate = "source .venv/bin/activate.fish";
      k = "kubectl";
      kt = "kubectl -n kube-dashboard create token admin-user | pbcopy";
      kn = "kubectl get nodes -o wide -w";
      kp = "kubectl get pods -A -o wide -w";
      kf = ''kubectl delete pod --field-selector="status.phase == Failed" -A'';
      kd = "kubectl drain --ignore-daemonsets --delete-emptydir-data";
      mpvtct = "mpv --vo=tct --profile=sw-fast --vo-tct-algo=plain --vo-tct-256=yes --really-quiet";
      jotta = "rclone mount jotta-crypt: ~/rclone --vfs-cache-mode writes --daemon";
      sd = "rclone mount steamdeck:/run/media/mmcblk0p1 ~/rclone --vfs-cache-mode writes";
    };
    shellAliases = {
      history-backup = ''rclone copyto $HOME/.local/share/fish/fish_history jotta-crypt:local_secrets/(python3 -c "import socket; print(socket.gethostname())")/fish_history -P'';
    };
    functions = {
      fish_user_key_bindings = ''
        fzf_key_bindings
        bind © fzf-cd-widget
      '';
    };
  };
}
