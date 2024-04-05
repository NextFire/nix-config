{ lib
, stdenvNoCC
, amaranth-src
}:
stdenvNoCC.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "amaranth";
  version = builtins.substring 0 7 amaranth-src.rev;

  src = amaranth-src;

  installPhase = ''
    runHook preInstall
    install -Dm644 fonts/ttf/*.ttf -t $out/share/fonts/truetype
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://fonts.google.com/specimen/Amaranth";
    description = "Font designed by Gesine Todt";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
