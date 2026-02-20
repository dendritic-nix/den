{
  __findFile,
  constants,
  ...
}: {
  den.hosts.x86_64-linux.acerus.users = {
    ${constants.user_two} = {};
    ${constants.user_three} = {};
  };

  den.aspects.acerus = {
    nixos = {lib, ...}: {
      imports = [];

      boot.initrd.availableKernelModules = [
        "nvme"
        "ahci"
        "xhci_pci"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "sr_mod"
      ];

      disko.devices.disk.btrfs.device = lib.mkForce "/dev/disk/by-id/nvme-eui.002538ba11b6cb55";
    };

    includes = [
      <disko/btrfs>

      <system/systemd-boot>
      <system/locale>
      <system/ssh>
      <system/sshd>
      <system/audio>
      <system/fonts>
      <system/networking>
      <system/nvidia>
      <system/xdg>

      # <desktop/sddm>
      # <desktop/kde>
      <desktop/gnome>

      <apps/ghostty>
      <apps/zen>
      <apps/firefox>

      <services/tailscale>
      <services/kanata>
    ];
  };
}
