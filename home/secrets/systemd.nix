{ pkgs, config, lib, ... }:
lib.mkIf pkgs.stdenv.isLinux {
  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
  home.activation.setupEtc = config.lib.dag.entryAfter [ "writeBoundary" ] ''
    /usr/bin/systemctl start --user sops-nix
  '';
}
