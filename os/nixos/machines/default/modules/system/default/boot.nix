# boot.nix
{
  boot.loader = {
    efi = {
       canTouchEfiVariables = false;
       efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
      efiInstallAsRemovable = true;
    };
  };
}
