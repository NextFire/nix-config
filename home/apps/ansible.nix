{ pkgs, ... }: {
  home.file.".ansible.cfg".text = ''
    [defaults]
    stdout_callback = yaml
    bin_ansible_callbacks = True

    [diff]
    always = True
  '';

  # FIXME: too big, I prefer `pipx install ansible-core`
  # home.packages = [ pkgs.ansible ];
}
