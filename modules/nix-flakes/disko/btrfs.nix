{lib, ...}: let
  device = lib.mkDefault "/dev/disk/by-id/nvme-eui.002538ba11b6cb55";
  mountOptions = [
    "noatime"
    "compress=zstd"
  ];
in {
  den.aspects.disko._.btrfs.nixos.disko = {
    devices = {
      disk = {
        btrfs = {
          type = "disk";
          inherit device;
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                priority = 1;
                name = "ESP";
                start = "1M";
                end = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = ["umask=0077"];
                };
              };

              swap = {
                priority = 2;
                size = "16G";
                content = {
                  type = "swap";
                  resumeDevice = true;
                };
              };

              root = {
                priority = 3;
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                  mountOptions = ["noatime"];
                };
              };
            };
          };
        };
      };
    };
  };
}
