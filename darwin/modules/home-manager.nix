{ pkgs, inputs, self, inputs', self', username, ... }: {
  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.fish;
  };

  imports = [ inputs.home-manager.darwinModules.home-manager ];

  home-manager.useGlobalPkgs = false;
  home-manager.useUserPackages = true;

  home-manager.users.${username} = import ../../home/home.nix;
  home-manager.extraSpecialArgs = { inherit inputs self inputs' self'; };

  home-manager.backupFileExtension = "backup";
}
