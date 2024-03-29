{ pkgs, ... }: {
  home.file.".ansible.cfg".text = ''
    [defaults]
    stdout_callback = yaml
    bin_ansible_callbacks = True

    [diff]
    always = True
  '';

  home.packages = [ pkgs.ansible ];
}
