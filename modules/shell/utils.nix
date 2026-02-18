{
  den.aspects.shell._.utils.homeManager =
    { pkgs, ... }:
    {
      services.ssh-agent = {
        enable = true;
        enableFishIntegration = true;
        enableNushellIntegration = true;
      };

      programs = {
        starship = {
          enable = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
        };

        fzf = {
          enable = true;
          enableFishIntegration = true;
        };

        eza = {
          enable = true;
          enableFishIntegration = true;
        };

        zoxide = {
          enable = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
        };

        broot = {
          enable = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
        };

        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };

        carapace = {
          enable = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
        };

        atuin = {
          enable = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
        };

        pay-respects = {
          enable = true;
          enableFishIntegration = true;
          enableNushellIntegration = true;
        };

        bat = {
          enable = true;
          config = {
            theme = "Catppuccin Mocha";
          };
          extraPackages = with pkgs.bat-extras; [
            batgrep
            batman
            batpipe
            batwatch
            batdiff
            prettybat
          ];
        };

        btop = {
          enable = true;
          package = pkgs.btop.override {
            cudaSupport = true;
          };
          settings = {
            color_theme = "Dracula";
            theme_background = false;
            vim_keys = true;
          };
        };
      };
    };
}
