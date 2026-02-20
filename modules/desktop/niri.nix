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
      programs.niri.settings = {
        binds = {
          "Mod+Z".action.spawn = ["zen"];
          "Mod+G".action.spawn = ["ghostty"];
        };
      };
    };
  };
}
