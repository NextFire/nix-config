{ inputs, config, ... }: {
  imports = [
    inputs.sops-nix.homeManagerModules.sops
    ./systemd.nix
  ];

  sops = {
    defaultSopsFile = ./secrets.sops.yaml;
    age.keyFile = "${config.home.homeDirectory}/.nix-config.key.txt";
  };
}
