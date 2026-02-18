{
  den.aspects.system._.systemd-boot.nixos = {
    boot = {
      loader = {
        systemd-boot = {
          enable = true;
          configurationLimit = 10;
          editor = false;
        };
        efi.canTouchEfiVariables = true;
        timeout = 3;
      };
    };
  };
}
