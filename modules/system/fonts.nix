{
  den.aspects.system._.fonts.nixos =
    {
      pkgs,
      ...
    }:
    {
      fonts = {
        fontconfig = {
          enable = true;
          subpixel.rgba = "rgb";
          hinting.enable = true;
          hinting.style = "slight";
          antialias = true;

          defaultFonts = {
            serif = [
              "Noto Serif"
              "Liberation Serif"
            ];
            sansSerif = [
              "Noto Sans"
              "Liberation Sans"
            ];
            monospace = [
              "JetBrains Mono"
              "Liberation Mono"
            ];
            emoji = [ "Noto Color Emoji" ];
          };
        };

        packages = with pkgs; [
          # Nerd Fonts
          nerd-fonts.fira-code
          nerd-fonts.atkynson-mono
          nerd-fonts.caskaydia-cove
          nerd-fonts.caskaydia-mono
          nerd-fonts.hack
          nerd-fonts.iosevka
          nerd-fonts.jetbrains-mono

          # System fonts
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-color-emoji
          liberation_ttf

          # Programming fonts
          jetbrains-mono
          fira-code
          source-code-pro

          # Popular fonts
          roboto
          open-sans
          ubuntu-classic

          # Icon fonts
          font-awesome
        ];
      };
    };
}
