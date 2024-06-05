# graphics.nix
{ config, lib, pkgs, ...}:
{
  services.xserver.videoDrivers = ["amdgpu"];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    setLdLibraryPath = true;
    extraPackages = with pkgs; [
      libGL
      vaapiVdpau
      libvdpau-va-gl
      mesa.drivers
    ];
  };
}

