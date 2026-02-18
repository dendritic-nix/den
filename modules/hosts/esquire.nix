{
  __findFile,
  ...
}:
{
  den.hosts.x86_64-linux.esquire.users.chianyung = { };

  den.aspects.esquire = {
    nixos =
      { lib, ... }:
      {
        imports = [ ];

        boot.initrd.availableKernelModules = [
          "sd_mod"
          "sr_mod"
        ];

        disko.devices.disk.btrfs.device = lib.mkForce "/dev/disk/by-id/nvme-eui.002538ba11b6cb55";

      };
  };
}
