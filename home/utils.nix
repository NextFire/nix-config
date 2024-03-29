{ program, config }:
let
  repoPath = "${config.home.homeDirectory}/nix-config";
  programsDir = "${repoPath}/home/programs";
  secretsDir = "${repoPath}/secrets";
in
{
  link = path: config.lib.file.mkOutOfStoreSymlink "${programsDir}/${program}/${builtins.baseNameOf path}";
  linkSecret = path: config.lib.file.mkOutOfStoreSymlink "${secretsDir}/${program}/${builtins.baseNameOf path}";
}
