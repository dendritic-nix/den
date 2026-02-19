{constants, ...}: {
  den.aspects.system._.virt.nixos = {pkgs, ...}: {
    users.users.${constants.user_chianyung}.extraGroups = [
      "libvirtd"
      "kvm"
    ];

    boot.kernelModules = ["kvm-intel"];

    environment.systemPackages = with pkgs; [
      qemu_kvm
      quickemu
      quickgui
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      win-virtio
      win-spice
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
          ovmf.enable = true;
          ovmf.packages = [pkgs.OVMFFull.fd];
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;
  };
}
