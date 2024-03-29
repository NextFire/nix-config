{ pkgs, ... }: {
  home.file."Library/Application Support/pypoetry/config.toml".text = ''
    [virtualenvs]
    in-project = true
  '';

  home.packages = [ pkgs.poetry ];
}
