{
  __findFile,
  constants,
  ...
}: {
  den.hosts.aarch64-darwin.mbp.users.${constants.user_one} = {};

  den.aspects.mbp = {
    includes = [
    ];

    homeManager = {
      home.file."Library/Application Support/Zen/Profiles/default" = {
        force = true;
        recursive = true;
        source = ../../dots/config/zen/Profiles/default;
      };

      home.file."Library/Application Support/Zen/profiles.ini".text = ''
        [General]
        StartWithLastProfile=1

        [Profile0]
        Default=1
        IsRelative=1
        Name=default
        Path=Profiles/default
      '';
    };

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
