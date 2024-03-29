{ config, ... }: {
  sops.secrets."ssh/config".path = "${config.home.homeDirectory}/.ssh/config";
  sops.secrets."ssh/id_ed25519".path = "${config.home.homeDirectory}/.ssh/id_ed25519";
  home.file.".ssh/id_ed25519.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAf0XdYYcV+eqm/IKre3xJlcZNtHTdiD8aDfb6U4+eNd namvu@MacBook-Pro-de-Nam.local";
}
