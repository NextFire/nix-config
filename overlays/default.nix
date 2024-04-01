{ inputs, ... }: {
  imports = [ inputs.flake-parts.flakeModules.easyOverlay ];
  perSystem = { pkgs, lib, ... }: {
    overlayAttrs = {
      # FIXME: https://github.com/NixOS/nixpkgs/pull/298528
      pipx = pkgs.pipx.overrideAttrs (oldAttrs: {
        disabledTests = oldAttrs.disabledTests ++ [ "test_skip_maintenance" ];
      });
    };
  };
}
