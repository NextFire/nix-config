{ config, ... }: {
  sops.secrets."fish/hikari.fish".path = "${config.xdg.configHome}/fish/functions/hikari.fish";

  programs.fish = {
    enable = true;
    loginShellInit = ''
      # set -x JAVA_HOME (/usr/libexec/java_home)
      set -x GOPATH ~/.go
      fish_add_path -P ~/.local/bin
      fish_add_path -aP ~/.krew/bin
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
    functions = {
      fish_user_key_bindings = ''
        fzf_key_bindings
        bind © fzf-cd-widget
      '';
      history-backup = ''
        set hostname (python3 -c "import socket; print(socket.gethostname())")
        rclone copyto $HOME/.local/share/fish/fish_history jotta-crypt:local_secrets/$hostname/fish_history -P
      '';
      ngc = ''
        nix-collect-garbage -d
        sudo nix-collect-garbage -d
      '';
      dinit = ''
        nix flake new -t github:nix-community/nix-direnv .
      '';
      duse = ''
        echo use flake local#$argv[1] >> .envrc
        direnv allow
      '';
    };
  };
}
