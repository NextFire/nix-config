final: prev: {
  aegisub = prev.aegisub.overrideAttrs (oldAttrs: {
    version = oldAttrs.version + "-Japan7+2024-03-04";
    src = prev.fetchFromGitHub {
      owner = "odrling";
      repo = "Aegisub";
      rev = "6bd3a9121cb3231c53df16a525293a387059c26d";
      sha256 = "sha256-WEw7OuThDlqNVChgUNcGeJ/uZ2F5pUPcPQnbEgKolb4=";
    };
  });
  syncplay = prev.syncplay.overrideAttrs (oldAttrs: {
    version = oldAttrs.version + "-Japan7+2024-03-01";
    src = prev.fetchFromGitHub {
      owner = "odrling";
      repo = "syncplay";
      rev = "41d0d952d1ed2b51994d3b9a64665540fdffb91d";
      sha256 = "sha256-emGFzfJ1xmHiLvQ3gwp/Wt2QNqzaTslz5MCmxuk2hrE=";
    };
    patches = builtins.tail oldAttrs.patches;
  });
}
