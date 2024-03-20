# graphics.nix
{ config, lib, pkgs, ...}:
{
  services.xserver.videoDrivers = ["intel"];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
#      libvdpau-va-gl
#      mesa.drivers
    ];
  };
}

