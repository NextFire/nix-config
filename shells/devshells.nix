{ pkgs, ... }: {
  helmfile = pkgs.mkShell {
    packages =
      let
        kubernetes-helm-wrapped = with pkgs; wrapHelm kubernetes-helm {
          plugins = with pkgs.kubernetes-helmPlugins; [
            helm-diff
            helm-git
            helm-s3
            helm-secrets
          ];
        };
        helmfile-wrapped = pkgs.helmfile-wrapped.override {
          inherit (kubernetes-helm-wrapped) pluginsDir;
        };
      in
      [ kubernetes-helm-wrapped helmfile-wrapped ];
  };

  rust = pkgs.mkShell {
    packages = with pkgs; [
      fenix.stable.minimalToolchain
    ];
  };
}
