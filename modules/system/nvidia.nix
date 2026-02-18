{
  den.aspects.system._.nvidia.nixos = {lib, ...}: {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
      ];

    services.xserver.videoDrivers = ["nvidia"];
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
