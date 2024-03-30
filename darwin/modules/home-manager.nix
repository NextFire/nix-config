{ inputs, inputs', self', username, ... }: {
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = import ../../home/home.nix;

  home-manager.extraSpecialArgs = { inherit inputs inputs' self'; };

  home-manager.backupFileExtension = "old";
}
