{
  programs.yt-dlp = {
    enable = true;
    settings = {
      format-sort = "res:1080,vcodec:h264,acodec:aac";
      cookies-from-browser = "safari";
      mark-watched = true;
    };
  };
}
