# network.nix
{ config, ...}:
{
  networking.hostName = "mobile";
  networking.wireless.enable = true;
  networking.wireless.userControlled.enable = true;
}

