# FIXME: https://github.com/NixOS/nixpkgs/pull/298528
{
  perSystem = { pkgs, lib, ... }: {
    overlayAttrs = {
      pipx = pkgs.pipx.overrideAttrs (oldAttrs: {
        disabledTests = oldAttrs.disabledTests ++ [ "test_skip_maintenance" ];
      });
    };
  };
}
