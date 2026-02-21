{__findFile, ...}: {
  den.aspects.desktop._.niri = {
    includes = [<desktop/sddm>];

    nixos = {
      services.xserver.enable = true;
      services.xserver.xkb.layout = "us";

      programs.niri.enable = true;
      security.polkit.enable = true;
    };

    homeManager = {
      xdg.configFile."niri/config.kdl".source = ../../dots/config/niri/config.kdl;
    };
  };
}
