{
  den.aspects.system._.nvidia.nixos = {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware = {
      nvidia = {
        open = true;
        nvidiaSettings = true;
        modesetting.enable = true;
        powerManagement.enable = true;
        powerManagement.finegrained = false;
      };
    };
  };
}
