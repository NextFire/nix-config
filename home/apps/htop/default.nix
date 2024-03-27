{ config, ... }: {
  programs.htop = {
    enable = true;
    settings = {
      fields = with config.lib.htop.fields; [
        PPID
        PID
        USER
        PRIORITY
        NICE
        M_SIZE
        M_RESIDENT
        M_SHARE
        STATE
        PERCENT_CPU
        PERCENT_MEM
        TIME
        COMM
      ];
    } // (with config.lib.htop; leftMeters [
      (bar "CPU")
      (bar "Memory")
      (bar "Swap")
      (text "Hostname")
      (text "System")
      (text "Uptime")
      (text "LoadAverage")
    ]) // (with config.lib.htop; rightMeters [
      (bar "AllCPUs2")
      (text "Tasks")
      (text "DiskIO")
      (text "NetworkIO")
    ]);
  };
}
