{ pkgs, lib, ... }: {
  xdg.configFile."ncdu/config".text = lib.concatMapStrings (x: x + "\n") [
    "--color off"
  ];

  home.packages = [ pkgs.ncdu ];
}
