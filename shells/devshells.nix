{ pkgs, ... }: {
  rust = pkgs.mkShell {
    packages = with pkgs; [
      fenix.stable.minimalToolchain
    ];
  };
}
