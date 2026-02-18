# Bootstrap NixOS with this repo

This guide explains how to install a fresh NixOS system using the flake configuration in this repository.

## TL;DR

Run this from a NixOS installer/live environment:

```console
git clone <your-repo-url> den
cd den
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#just -c just disko-install esquire btrfs /dev/disk/by-id/nvme-eui.002538ba11b6cb55
reboot
```

`disko-install` will partition and format the target disk.

## Quick concepts

- `esquire` = NixOS host name (see `modules/hosts/esquire.nix`)
- `btrfs` = Disko disk key (see `modules/nix-flakes/disko/btrfs.nix`)
- `/dev/nvme1n1` = target block device

The `just disko-install` recipe is defined in `justfile` and runs `disko-install` from `nix-community/disko`.

## Prerequisites

- Booted into a NixOS installer/live ISO
- Working internet connection
- Correct target disk identified (for example with `lsblk`)
- You understand the target disk data will be erased

## Full bootstrap steps

1. Enter the installer shell as `root`.
2. Clone this repository:

   ```console
   git clone <your-repo-url> den
   cd den
   ```

3. Verify the target disk name:

   ```console
   lsblk -o NAME,SIZE,MODEL
   ```

4. Run the installer command:

   ```console
   nix --extra-experimental-features "nix-command flakes" shell nixpkgs#just -c just disko-install esquire btrfs /dev/disk/by-id/nvme-eui.002538ba11b6cb55
   ```

   If `just` is already available, you can run:

   ```console
   just disko-install esquire btrfs /dev/nvme1n1
   ```

5. Reboot when it finishes:

   ```console
   reboot
   ```

## If you get `No space left on device` during install

You can run the install manually and remount the temporary nix store with a larger size:

```console
sudo nix run github:nix-community/disko/latest -- --mode destroy,format,mount --flake .#esquire --disk btrfs /dev/disk/by-id/nvme-eui.002538ba11b6cb55
sudo mount -o remount,size=20G,noatime /nix/.rw-store
sudo nixos-install --flake .#esquire
```

## Important disk note

The `esquire` host currently forces the disk device to this by-id path in `modules/hosts/esquire.nix`:

```nix
disko.devices.disk.btrfs.device = lib.mkForce "/dev/disk/by-id/nvme-eui.002538ba11b6cb55";
```

If you install on another machine or disk, update that by-id value to match the actual device.

## Post-install verification

After booting into the installed system, run:

```console
findmnt /
findmnt /home
findmnt /nix
```

All three should be mounted as btrfs subvolumes (`@`, `@home`, `@nix`).

## References

- den documentation: <https://vic.github.io/den>
- Disko: <https://github.com/nix-community/disko>
