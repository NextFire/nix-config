{ pkgs, ... }: {
  go = with pkgs; mkShell {
    packages = [
      go
      go-tools
      gopls
    ];
  };

  helmfile = with pkgs; mkShell {
    packages =
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
      [ kubernetes-helm-wrapped helmfile-wrapped-overrided ];
  };

  rust = with pkgs; mkShell {
    packages = [
      fenix.stable.minimalToolchain
    ];
  };
}
