{
  den.aspects.shell._.yazi.homeManager =
    { pkgs, ... }:
    let
      flavors = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "flavors";
        rev = "main";
        sha256 = "sha256-tCAJXPV7s1akc+zHGdWjmdMPG4NpBE92vcO7LAvI5TI=";
      };
    in
    {
      home.packages = with pkgs; [
        yazi
        rich-cli
        glow
      ];

      programs = {
        yazi = {
          enable = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
          flavors = {
            catppuccin-mocha = "${flavors}/flavors/catppuccin-mocha.yazi";
            catppuccin-macchiato = "${flavors}/catppuccin-macchiato.yazi";
          };
          theme = {
            flavor = {
              use = "catppuccin-mocha";
            };
          };
          plugins = {
            glow = pkgs.fetchFromGitHub {
              owner = "Reledia";
              repo = "glow.yazi";
              rev = "main";
              hash = "sha256-celObHo9Y3pFCd1mTx1Lz77Tc22SJTleRblAkbH/RqY=";
            };
            rich-preview = pkgs.fetchFromGitHub {
              owner = "AnirudhG07";
              repo = "rich-preview.yazi";
              rev = "main";
              hash = "sha256-celObHo9Y3pFCd1mTx1Lz77Tc22SJTleRblAkbH/RqY=";
            };
          };
          settings = {
            mgr = {
              show_hidden = true;
            };
            plugin = {
              prepend_previewers = [
                # { name = "*.md"; run = "glow"; }
                {
                  name = "*.csv";
                  run = "rich-preview";
                } # for csv files
                {
                  name = "*.md";
                  run = "rich-preview";
                } # for markdown (.md) files
                {
                  name = "*.rst";
                  run = "rich-preview";
                } # for restructured text (.rst) files
                {
                  name = "*.ipynb";
                  run = "rich-preview";
                } # for jupyter notebooks (.ipynb)
                {
                  name = "*.json";
                  run = "rich-preview";
                } # for json (.json) files
                #    { name = "*.lang_type"; run = "rich-preview"} # for particular language files eg. .py, .go., .lua, etc.
              ];
            };
          };
        };
      };
    };
}
