# graphics.nix
{ pkgs, ...}:
{
  services.xserver.videoDrivers = ["nvidia"];
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

