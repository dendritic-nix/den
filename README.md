# Bootstrap NixOS with this repo

This guide explains how to install a fresh NixOS system using the flake configuration in this repository.

## 1. About this repository

This repo contains:

- NixOS host configuration (for example `modules/hosts/esquire.nix`)
- Disk layout managed by Disko
- `justfile` recipes to run installation from a live ISO

Quick concepts:

- `esquire` = NixOS host name
- `btrfs` = Disko disk key

Both `disko-install` and `disko-install-remount` recipes accept an optional `flake` argument.

In this repository's `justfile`, both `disko-install` and `disko-install-remount`
default to `flake='.'` (the local checkout).

Override with `flake=<value>` when needed (for example `flake=github:dendritic-nix/den`).

## 2. Bootstrap from live ISO (recommended)

Prerequisites:

- Booted into a NixOS installer/live ISO
- Working internet connection
- Correct target disk identified (for example with `lsblk`)
- You understand the target disk data will be erased

Run this from the installer shell as `root`:

```console
git clone https://github.com/dendritic-nix/den.git den && cd den
lsblk -o NAME,SIZE,MODEL
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#just -c just disko-install-remount <hostname>
reboot
```

Focus: simply run the `just disko-install-remount <hostname>` command above (via `nix shell`).

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
