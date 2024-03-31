{ lib, stdenvNoCC, fetchFromGitHub, ... }:
stdenvNoCC.mkDerivation rec {
  name = "amaranth";
  version = "unstable-2021-07-21";

  src = fetchFromGitHub {
    owner = "googlefonts";
    repo = name;
    rev = "f4f60a57f54a04186030913a86e3e56105bbe848";
    hash = "sha256-2endXDoqh58gXMz6bcOTUpvKJPYbWdnv6qGNkeQT2QI=";
  };

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
