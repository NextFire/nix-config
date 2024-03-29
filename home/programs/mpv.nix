{ pkgs, config, ... }:
let
  scriptPath = script: "${script}/share/mpv/scripts/${script.scriptName}";
in
{
  sops.secrets."mpv/japan7.lua".path = "${config.home.homeDirectory}/.config/mpv/scripts/japan7.lua";

  programs.mpv = {
    enable = true; # FIXME: mpv is installed twice on macOS
    scripts = with pkgs.mpvScripts; [ autoload ];
    bindings = {
      "AXIS_DOWN" = "add volume 1";
      "AXIS_UP" = "add volume -1";
      "UP" = "add volume 1";
      "DOWN" = "add volume -1";
      "Shift+RIGHT" = "frame-step";
      "Shift+LEFT" = "frame-back-step";
      "Shift+UP" = "add volume 10";
      "Shift+DOWN" = "add volume -10";
      "a" = "add sub-delay -0.05";
      "z" = "add sub-delay +0.05";
      "Z" = "ignore";
      "h" = "cycle deband";
      "H" = ''apply-profile interpolation restore; apply-profile quality restore; show_text "profile=default"'';
      "g" = ''apply-profile interpolation restore; apply-profile quality; show_text "profile=quality"'';
      "G" = ''apply-profile quality restore; apply-profile interpolation; show_text "profile=interpolation"'';
      "F" = "sub-reload";
    };
    config = {
      scripts = scriptPath pkgs.mpvScripts.autoload;

      #General
      # vo = "gpu";
      # gpu-api = "opengl";
      hwdec = "auto-safe";
      save-position-on-quit = true;
      # osd-status-msg = "\${playback-time/full} / \${duration} (\${percent-pos}%)\nframe: \${estimated-frame-number} / \${estimated-frame-count}";
      # demuxer-max-bytes = "2G";

      #Window
      autofit = "50%x50%";
      geometry = "100%:100%";
      ontop = true;

      #macOS specifics
      icc-profile-auto = true;
      # icc-force-contrast = "inf";
      vf = "format=gamma=gamma2.2";
      gamma-factor = 1.1218765935747068;

      #Priority
      slang = "en,eng,fr,fra,fre";
      alang = "ja,jp,jpn,en,eng,fr,fra,fre";
      audio-file-auto = "exact";

      #Subs
      demuxer-mkv-subtitle-preroll = true;
      # sub-ass-vsfilter-blur-compat = false;
      sub-fix-timing = true;
      # sub-font = "Trebuchet MS";
      # sub-font-size = 35;
      sub-use-margins = false;

      #Volume
      volume-max = 200;

      #Screenshot
      screenshot-format = "png";
      screenshot-tag-colorspace = true;
      # screenshot-png-filter = 0;
      # screenshot-webp-lossless = true;
      screenshot-directory = "~/Desktop";
      screenshot-template = "%f-%wH.%wM.%wS.%wT-#%#00n";
    };
    profiles = {
      base = {
        #General
        hwdec = false;
        profile = "gpu-hq";

        #Dither
        # dither-depth = "auto";
        # dither = "fruit";
        # error-diffusion = "sierra-lite";

        #Deband
        deband = true;
        deband-iterations = 4;
        deband-threshold = 48;
        deband-range = 16;
        deband-grain = 24;

        #Resizer
        correct-downscaling = true;
        linear-downscaling = true;
        linear-upscaling = true;
        sigmoid-upscaling = true;

        #Anti-Ringing
        scale-antiring = 0.7;
        dscale-antiring = 0.7;
        cscale-antiring = 0.7;
      };
      quality = {
        profile-restore = "copy";
        profile = "base";

        #Resizer
        scale = "spline64";
        dscale = "spline64";
        cscale = "sinc";
        cscale-window = "blackman";
        cscale-radius = 3;

        #Interpolation
        blend-subtitles = false;
        video-sync = "audio";
        interpolation = false;
      };
      interpolation = {
        profile-restore = "copy";
        profile = "base";

        #Resizer
        scale = "spline36";
        dscale = "spline36";
        cscale = "sinc";
        cscale-window = "blackman";
        cscale-radius = 3;

        #Interpolation;
        blend-subtitles = true;
        video-sync = "display-resample";
        interpolation = true;
        tscale = "box";
        tscale-window = "quadric"; #(or "sphinx")
        tscale-radius = 1.0; #lower (e.g. 0.955) = sharper; higher (e.g. 1.005) = smoother
        tscale-clamp = 0.0;
      };
    };
  };
}
