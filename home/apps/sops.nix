{ pkgs, config, ... }: {
  sops.secrets."sops_/keys.txt".path = "${config.home.homeDirectory}/Library/Application Support/sops/age/keys.txt";

  home.packages = [ pkgs.sops ];
}
