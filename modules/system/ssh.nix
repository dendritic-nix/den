{
  den.aspects.system._.ssh = {
    nixos = {};
    homeManager = {
      programs.ssh = {
        enableDefaultConfig = false;
        matchBlocks = {
          "*" = {};
          ghcny = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh_keys/github-cnycode.pub";
          };
          ghspy = {
            hostname = "github.com";
            user = "git";
            identityFile = "~/.ssh_keys/github-seraphynee.pub";
          };
        };
      };
    };
  };

  den.aspects.system._.sshd = {
    nixos = {
      services.sshd.enable = true;
      services.openssh = {
        enable = true;
        settings = {
          AllowAgentForwarding = "yes";
          PasswordAuthentication = false;
        };
      };
    };

    provides = {
      forward-ports.nixos = {
        virtualisation.vmVariant.virtualisation.forwardPorts = [
          {
            host.port = 2222;
            guest.port = 22;
          }
        ];
      };
    };
  };
}
