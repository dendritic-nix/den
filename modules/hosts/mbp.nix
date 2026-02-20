{
  __findFile,
  constants,
  ...
}: {
  den.hosts.aarch64-darwin.mbp.users.${constants.user_one} = {};

  den.aspects.mbp = {
    includes = [
      <apps/zen>
    ];

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
