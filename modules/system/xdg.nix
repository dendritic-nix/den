{
  den.aspects.system._.xdg.homeManager = {config, ...}: {
    home.sessionVariables = {
      TERMINAL = "ghostty";
      # BROWSER = "zen";
      EDITOR = "nvim";
      PAGER = "less";
      GIT_EDITOR = "nvim";
      # AUDIO_PLAYER = "mpv";
      # VIDEO_PLAYER = "mpv";
    };
    xdg = {
      enable = true;
      #   mimeApps.defaultApplications =
      #     let
      #       browser = [ "zen.desktop" ];
      #       fileManager = [ "org.kde.dolphin.desktop" ];
      #       editor = [ "code.desktop" ];
      #       player = [ "mpv.desktop" ];
      #       viewer = [ "nsxiv.desktop" ];
      #       reader = [ "org.pwmt.zathura.desktop" ];
      #     in
      #     {
      #       "application/pdf" = reader;
      #       "application/epub" = reader;
      #       "application/epub+zip" = reader;
      #
      #       "text/html" = browser;
      #       "text/xml" = browser;
      #       "text/plain" = editor;
      #       "text/*" = editor;
      #       "application/x-wine-extension-ini" = editor;
      #
      #       "application/json" = browser;
      #       "application/xml" = browser;
      #       "application/xhtml+xml" = browser;
      #       "application/xhtml_xml" = browser;
      #       "application/rdf+xml" = browser;
      #       "application/rss+xml" = browser;
      #       "application/x-extension-htm" = browser;
      #       "application/x-extension-html" = browser;
      #       "application/x-extension-shtml" = browser;
      #       "application/x-extension-xht" = browser;
      #       "application/x-extension-xhtml" = browser;
      #
      #       "x-scheme-handler/about" = browser;
      #       "x-scheme-handler/ftp" = browser;
      #       "x-scheme-handler/http" = browser;
      #       "x-scheme-handler/https" = browser;
      #
      #       "inode/directory" = fileManager;
      #
      #       "audio/*" = player;
      #       "video/*" = player;
      #
      #       "image/*" = viewer;
      #       "image/gif" = viewer;
      #       "image/jpeg" = viewer;
      #       "image/png" = viewer;
      #       "image/webp" = viewer;
      #     };
      # };
    };
  };
}
