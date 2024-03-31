# FIXME: https://github.com/NixOS/nixpkgs/pull/298528
final: prev: {
  pipx = prev.pipx.overrideAttrs (oldAttrs: {
    disabledTests = oldAttrs.disabledTests ++ [ "test_skip_maintenance" ];
  });
}
