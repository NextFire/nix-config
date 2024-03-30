{ pkgs, inputs', config, lib, ... }:
let
  inherit (inputs') krewfile;
in
{
  sops.secrets."kubectl/config".path = "${config.home.homeDirectory}/.kube/config";

  home.file.".krewfile" = {
    text = lib.concatMapStrings (x: x + "\n") [
      "cnpg"
      "df-pv"
      "node-shell"
      "pv-migrate"
    ];
    onChange =
      let
        path = lib.concatMapStrings (x: x + ":") [
          "$HOME/.nix-profile/bin"
          "/etc/profiles/per-user/$HOME/bin"
          "/run/current-system/sw/bin"
          "/usr/bin"
        ];
      in
      "PATH=${path}:$PATH sh -c 'krew update && krewfile -upgrade'";
  };

  home.packages = (with pkgs; [
    helmfile
    krew
    kubectl
    kubernetes-helm
    kustomize
    stern
  ]) ++ [
    krewfile.packages.default
  ];
}
