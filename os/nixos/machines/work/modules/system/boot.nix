# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.efi.efiSysMountPoint = "/boot";

  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-partuuid/b1f308c6-1685-4616-9a21-0aaf80db77b7";
      allowDiscards = true;
      preLVM = true;
    };
  };
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };
 }
