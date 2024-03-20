# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-partuuid/0be36107-43e5-4d6c-b4f5-bcd3d3a22c6f";
      allowDiscards = true;
      preLVM = true;
    };
  };
}

