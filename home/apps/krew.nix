{ pkgs, config, lib, inputs, ... }:
let
  krewfile = inputs.krewfile.packages.${pkgs.system}.krewfile;
in
{
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
          "/etc/profiles/per-user/${config.home.username}/bin"
          "/run/current-system/sw/bin"
          "/usr/bin"
        ];
      in
      "PATH=${path}:$PATH sh -c 'krew update && krewfile -upgrade'";
  };

  home.packages = [ pkgs.krew krewfile ];
}
