{ pkgs, lib, ... }: {
  home.file.".config/ncdu/config".text = lib.concatMapStrings (x: x + "\n") [
    "--color off"
  ];

  home.packages = [ pkgs.ncdu ];
}
