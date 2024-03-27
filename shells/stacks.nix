{ pkgs, mkShell }:
{
  python = mkShell (with pkgs; [
    python3
  ]);

  node = mkShell (with pkgs; [
    nodejs
  ]);
}
