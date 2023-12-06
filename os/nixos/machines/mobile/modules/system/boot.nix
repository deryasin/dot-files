# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  boot.loader.efi.canTouchEfiVariables = false;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/3457d6e8-b3df-414a-9199-1ef06827f03c";
      preLVM = true;
      allowDiscards = true;
    };
  };
}

