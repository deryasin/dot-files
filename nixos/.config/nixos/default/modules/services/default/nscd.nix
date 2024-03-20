# services/nscd.nix
{ config, lib, pkgs, ... }:
{
  services.nscd.enableNsncd = true;
}
