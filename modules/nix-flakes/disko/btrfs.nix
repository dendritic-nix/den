let
  device = "/dev/sda";
  mountOptions = [
    "noatime"
    "compress=zstd"
    "ssd"
    "discard=async"
    "space_cache=v2"
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
              root = {
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = ["-f"];
                  subvolumes = {
                    "@" = {
                      mountpoint = "/";
                      inherit mountOptions;
                    };
                    "@home" = {
                      mountpoint = "/home";
                      inherit mountOptions;
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      inherit mountOptions;
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
