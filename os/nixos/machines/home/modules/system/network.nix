# network.nix
{ config, ...}:
{
  networking.hostName = "home";
  networking.wireless.enable = true;
  networking.wireless.userControlled.enable = true;
}

