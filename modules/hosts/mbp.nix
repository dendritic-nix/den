{constants, ...}: {
  den.hosts.aarch64-darwin.mbp.users.${constants.user_chianyung} = {};

  den.aspects.mbp = {
    darwin = {
      system.defaults = {
        dock = {
          autohide = true;
          orientation = "bottom";
        };

        NSGlobalDomain._HIHideMenuBar = true;
      };
    };
  };
}
