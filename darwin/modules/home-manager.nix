{ inputs, username, ... }:
let
  inherit (inputs) home-manager;
in
{
  imports = [ home-manager.darwinModules.home-manager ];

  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = import ../../home;
  home-manager.extraSpecialArgs = { inherit inputs; };

  home-manager.backupFileExtension = "old";
}
