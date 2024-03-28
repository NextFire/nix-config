{ appDir, config }:
let
  repoPath = "${config.home.homeDirectory}/nix-config";
  appsDir = "${repoPath}/home/apps";
  secretsDir = "${repoPath}/secrets";
in
{
  link = path: config.lib.file.mkOutOfStoreSymlink "${appsDir}/${builtins.baseNameOf appDir}/${builtins.baseNameOf path}";
  linkSecret = path: config.lib.file.mkOutOfStoreSymlink "${secretsDir}/${builtins.baseNameOf appDir}/${builtins.baseNameOf path}";
}
