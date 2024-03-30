{ lib, config, ... }: {
  home.file.".ssh/id_ed25519.pub".text = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAf0XdYYcV+eqm/IKre3xJlcZNtHTdiD8aDfb6U4+eNd namvu@MacBook-Pro-de-Nam.local";
  sops.secrets."ssh/id_ed25519".path = "${config.home.homeDirectory}/.ssh/id_ed25519";

  programs.ssh = {
    enable = true;
    extraConfig = lib.concatMapStrings (x: x + "\n") [
      "IdentityFile ~/.ssh/id_ed25519"
    ];
    matchBlocks = {
      "camp.yuru.moe" = {
        user = "root";
      };
      "nadeshiko.yuru.moe" = {
        user = "root";
      };
      "steamdeck" = {
        hostname = "10.200.0.4";
        user = "deck";
      };
      "japan7" = {
        hostname = "sftp.japan7.bde.enseeiht.fr";
        port = 8222;
        user = "nextfire#0733";
      };
      "polymtl" = {
        hostname = "l4712-21.info.polymtl.ca";
        user = "navux";
      };
    };
  };
}
