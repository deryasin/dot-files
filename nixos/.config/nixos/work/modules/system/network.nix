# network.nix
{ config, ...}:
{
  networking.hostName = "work";
  networking.wireless.enable = true;
  networking.wireless.userControlled.enable = true;
}

