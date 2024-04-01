{ syncplay, fetchFromGitHub, ... }:
syncplay.overrideAttrs (oldAttrs: {
  version = oldAttrs.version + "-Japan7+2024-03-01";
  src = fetchFromGitHub {
    owner = "odrling";
    repo = "syncplay";
    rev = "41d0d952d1ed2b51994d3b9a64665540fdffb91d";
    sha256 = "sha256-emGFzfJ1xmHiLvQ3gwp/Wt2QNqzaTslz5MCmxuk2hrE=";
  };
  patches = builtins.tail oldAttrs.patches;
})
