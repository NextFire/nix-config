{ lib
, stdenvNoCC
, ...
}:
stdenvNoCC.mkDerivation {
  name = "cookhand-std-r";

  src = lib.cleanSourceWith {
    src = ./.;
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 *.otf -t $out/share/fonts/opentype
    runHook postInstall
  '';
}
