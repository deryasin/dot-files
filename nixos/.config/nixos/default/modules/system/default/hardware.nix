# hardware.nix
{ config, ... }:
{
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
#  hardware.opengl = {
#    enable = true;
#    driSupport = true;
#    driSupport32Bit = true;
#  };

}
