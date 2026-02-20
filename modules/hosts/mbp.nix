{constants, ...}: {
  den.hosts.aarch64-darwin.mbp.users.micha = {};

  den.aspects.mbp = {
    darwin = {
      system.defaults = {
        dock = {
          autohide = true;
          orientation = "bottom";
        };

        NSGlobalDomain._HIHideMenuBar = true;
      };
      includes = [
        <apps/zen>
      ];
    };
  };
}
