{__findFile, ...}: {
  den.aspects.system._.settings = {
    darwin = {
      spaces.spans-displays = false;
      system.defaults = {
        menuExtraClock = {
          Show24Hour = true;
          IsAnalog = false;
        };
        finder = {
          ShowPathbar = true;
        };
        dock = {
          mru-spaces = false; # Whether to automatically rearrange spaces based on most recent use
          tilesize = 36;
          autohide = true;
          orientation = "bottom";
          show-recents = false;
          autohide-time-modifier = 0.5;
          autohide-delay = 0.1;
        };

        NSGlobalDomain._HIHideMenuBar = true;
      };
    };
    nixos = {};
  };
}
