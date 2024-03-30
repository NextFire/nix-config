{ pkgs, inputs, config, lib, ... }:
let
  inherit (inputs) sops-nix;
in
{
  imports = [ sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = ./secrets.sops.yaml;
    age.keyFile = "${config.home.homeDirectory}/.nix-config.key.txt";
  };
  systemd.user.services.mbsync.Unit.After = lib.mkIf pkgs.stdenv.isLinux [ "sops-nix.service" ];
  home.activation.setupEtc = lib.mkIf pkgs.stdenv.isLinux (
    config.lib.dag.entryAfter [ "writeBoundary" ] "/usr/bin/systemctl start --user sops-nix"
  );
}
