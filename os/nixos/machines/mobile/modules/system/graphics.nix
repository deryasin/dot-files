# graphics.nix
{ pkgs, ...}:
{
  services.xserver.videoDrivers = ["amd"];
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}

