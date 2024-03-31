{ pkgs, lib, ... }: {
  home.packages = with pkgs; [ ncdu_1 ];

  xdg.configFile."ncdu/config".text = lib.concatMapStrings (x: x + "\n") [
    "--color off"
  ];
}
