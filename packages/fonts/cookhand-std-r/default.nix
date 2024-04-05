{ lib
, stdenvNoCC
}:
stdenvNoCC.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "cookhand-std-r";
  version = "UNKNOWN";

  src = lib.cleanSourceWith {
    src = ./.;
  };

  installPhase = ''
    runHook preInstall
    install -Dm644 *.otf -t $out/share/fonts/opentype
    runHook postInstall
  '';
}
