{
  den.aspects.system._.nvidia.nixos = {lib, ...}: {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "nvidia-x11"
      ];

    services.xserver.videoDrivers = ["nvidia"];
    boot.kernelParams = [
      "nvidia_drm.modeset=1"
    ];
    boot.blacklistedKernelModules = ["nouveau"];
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    hardware = {
      nvidia = {
        # RTX 30 series generally behaves more reliably with the proprietary module.
        open = false;
        nvidiaSettings = true;
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
      };
    };
  };
}
