# Install MacOS applications to the user Applications folder. Also update Docked applications
# https://github.com/nix-community/home-manager/issues/1341#issuecomment-1870352014
{ pkgs, lib, ... }:
lib.mkIf pkgs.stdenv.isDarwin {
  home.packages = with pkgs; [ jq ];

  home.extraActivationPath = with pkgs; [ rsync dockutil gawk ];

  home.activation.trampolineApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${builtins.readFile ./trampoline-apps.sh}
    fromDir="$HOME/Applications/Home Manager Apps"
    toDir="$HOME/Applications/Home Manager Trampolines"
    sync_trampolines "$fromDir" "$toDir"
  '';
}
