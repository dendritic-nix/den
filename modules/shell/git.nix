{
  den.aspects.shell._.git = {
    provides = {
      chianyungcode = {
        homeManager = {
          pkgs,
          lib,
          ...
        }: {
          programs.git = {
            enable = true;
            settings = {
              user = {
                name = "chianyungcode";
                email = "cnytechcode@gmail.com";
                signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWQKPz2Bz5ufdBQih3CFMXhpg21Rwzgy/RaT+Q0XNwS";
              };
              core.pager = "delta";
              gpg = {
                format = "ssh";
              };
              "gpg \"ssh\"" = {
                program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
              };
              commit = {
                gpgsign = true;
              };
            };
          };
        };
      };
      seraphyne = {
        homeManager = {
          pkgs,
          lib,
          ...
        }: {
          programs.git = {
            enable = true;
            settings = {
              user = {
                name = "seraphynee";
                email = "seraphyne31@gmail.com";
                signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWQKPz2Bz5ufdBQih3CFMXhpg21Rwzgy/RaT+Q0XNwS";
              };
              core.pager = "delta";
              gpg = {
                format = "ssh";
              };
              "gpg \"ssh\"" = {
                program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
              };
              commit = {
                gpgsign = true;
              };
            };
          };
        };
      };
    };
  };
}
