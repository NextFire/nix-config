{ pkgs, ... }: {
  go = pkgs.mkShell {
    packages = with pkgs; [
      go
      go-tools
      gopls
    ];
  };

  helmfile = pkgs.mkShell {
    packages = with pkgs;
      let
        kubernetes-helm-wrapped = wrapHelm kubernetes-helm {
          plugins = with kubernetes-helmPlugins; [
            helm-diff
            helm-git
            helm-s3
            helm-secrets
          ];
        };
        helmfile-wrapped-overrided = helmfile-wrapped.override {
          inherit (kubernetes-helm-wrapped) pluginsDir;
        };
      in
      [
        helmfile-wrapped-overrided
        kubernetes-helm-wrapped
        kustomize
      ];
  };

  meson = pkgs.mkShell {
    packages = with pkgs; [
      meson
      ninja
      pkg-config
    ];
  };

  rust = pkgs.mkShell {
    packages = with pkgs; [
      fenix.stable.minimalToolchain
    ];
  };
}
