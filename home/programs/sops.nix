{ pkgs, config, ... }:
let
  utils = import ../utils.nix { program = "sops"; inherit config; };
in
{
  home.file."Library/Application Support/sops/age/keys.txt".source = utils.linkSecret ./keys.txt;

  home.packages = [ pkgs.sops ];
}
