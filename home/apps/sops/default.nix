{ pkgs, config, ... }:
let
  linkSecret = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/secrets/sops/${path}";
in
{
  home.file."Library/Application Support/sops/age/keys.txt".source = linkSecret "keys.txt";

  home.packages = [ pkgs.sops ];
}
