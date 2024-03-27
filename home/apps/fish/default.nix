{
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
      dotfiles = "git --git-dir=$HOME/.git_dotfiles/ --work-tree=$HOME";
      history-backup = ''rclone copyto $HOME/.local/share/fish/fish_history jotta-crypt:local_secrets/(python3 -c "import socket; print(socket.gethostname())")/fish_history -P'';
    };
    functions = {
      fish_user_key_bindings = ''
        fzf_key_bindings
        bind © fzf-cd-widget
      '';
      secrets-commit = ''
        set PRE_PWD (pwd)
        cd $HOME
        tar cvfz .secrets.tar.gz .secrets/
        age -r age1p6dku6ru5c8u5enlzx2neg2l7l508adl3kxlq5mhpcjvx2vpt9gqjgjg7c .secrets.tar.gz > .secrets.tar.gz.age
        rm .secrets.tar.gz
        dotfiles add .secrets.tar.gz.age
        cd $PRE_PWD
        dotfiles status
      '';
      secrets-restore = ''
        set PRE_PWD (pwd)
        cd $HOME
        age -d -i ~/.dotfiles.key.age .secrets.tar.gz.age > .secrets.tar.gz
        tar xvf .secrets.tar.gz
        rm .secrets.tar.gz
        tree -a .secrets/
        cd $PRE_PWD
      '';
    };
  };
}
