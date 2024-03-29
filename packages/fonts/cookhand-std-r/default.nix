{ lib, stdenvNoCC, ... }:
let
  name = "cookhand-std-r";
in
stdenvNoCC.mkDerivation {
  inherit name;

  src = lib.cleanSourceWith {
    src = ./.;
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 *.otf -t $out/share/fonts/opentype
    runHook postInstall
  '';
}
