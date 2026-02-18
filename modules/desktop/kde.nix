{ __findFile, ... }:
{
  den.aspects.desktop._.kde = {
    includes = [ <desktop/sddm> ];
    nixos = {
      services.xserver.enable = true;
      services.desktopManager.plasma6.enable = true;
      services.xserver.xkb.layout = "us";
      programs.kdeconnect.enable = true;
    };
  };
}
