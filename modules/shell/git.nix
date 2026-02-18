{
  den.aspects.shell._.git = {
    provides = {
      chianyungcode = {
        homeManager =
          {
            pkgs,
            lib,
            ...
          }:
          {
            programs.git = {
              enable = true;
              userName = "chianyungcode";
              userEmail = "cnytechcode@gmail.com";
              extraConfig = {
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

                user = {
                  signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWQKPz2Bz5ufdBQih3CFMXhpg21Rwzgy/RaT+Q0XNwS";
                };
              };
            };
          };
      };
      seraphyne = {
        homeManager =
          {
            pkgs,
            lib,
            ...
          }:
          {
            programs.git = {
              enable = true;
              userName = "seraphynee";
              userEmail = "seraphyne31@gmail.com";
              extraConfig = {
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

                user = {
                  signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINWQKPz2Bz5ufdBQih3CFMXhpg21Rwzgy/RaT+Q0XNwS";
                };
              };
            };
          };
      };
    };
  };
}
