{ aegisub, fetchFromGitHub, ... }:
aegisub.overrideAttrs (oldAttrs: {
  version = oldAttrs.version + "-Japan7+2024-03-04";
  src = fetchFromGitHub {
    owner = "odrling";
    repo = "Aegisub";
    rev = "6bd3a9121cb3231c53df16a525293a387059c26d";
    sha256 = "sha256-WEw7OuThDlqNVChgUNcGeJ/uZ2F5pUPcPQnbEgKolb4=";
  };
})
