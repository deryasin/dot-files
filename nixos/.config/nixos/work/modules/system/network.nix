# network.nix
{ config, ...}:
{
  networking.hostName = "AST101412";
  networking.wireless.enable = true;
  networking.wireless.userControlled.enable = true;
}

