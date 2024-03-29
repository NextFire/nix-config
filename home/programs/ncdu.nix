{ pkgs, ... }: {
  home.file.".config/ncdu/config".text = ''
    --color off
  '';

  home.packages = [ pkgs.ncdu ];
}
