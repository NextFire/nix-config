{
  programs.starship = {
    enable = true;
    settings = {
      format = "$time$all$username@$hostname$status$jobs$character";
      add_newline = false;
      directory = {
        fish_style_pwd_dir_length = 1;
      };
      git_branch = {
        symbol = "🌱 ";
      };
      hostname = {
        disabled = false;
        ssh_only = false;
        format = "[$hostname]($style) ";
        style = "";
      };
      python = {
        python_binary = "python3";
      };
      status = {
        disabled = false;
        format = "[\[$symbol $common_meaning$signal_name$maybe_int\]]($style) ";
        map_symbol = true;
      };
      time = {
        disabled = false;
        format = "[\[$time\]]($style) ";
        style = "blue";
        time_format = "%R";
      };
      username = {
        disabled = false;
        show_always = true;
        format = "[$user]($style)";
        style_user = "green";
      };
    };
  };
}
