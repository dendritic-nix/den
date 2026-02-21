{
  __findFile,
  constants,
  ...
}: {
  den.hosts.aarch64-darwin.mbp.users.${constants.user_one} = {};

  den.aspects.mbp = {
    includes = [
      <system/settings>
      <security/sops>
    ];

    # homeManager = {
    #   home.file."Library/Application Support/zen" = {
    #     force = true;
    #     recursive = true;
    #     source = ../../dots/config/zen;
    #   };
    #
    #   # home.file."Library/Application Support/Zen/profiles.ini".text = ''
    #   #   [General]
    #   #   StartWithLastProfile=1
    #   #
    #   #   [Profile0]
    #   #   Default=1
    #   #   IsRelative=1
    #   #   Name=default
    #   #   Path=Profiles/default
    #   # '';
    # };

    darwin = {};
  };
}
