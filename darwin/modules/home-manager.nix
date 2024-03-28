{ inputs, username, ... }:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = import ../../home;

  home-manager.backupFileExtension = "old";
}
