# configuration.nix
{ system, config, pkgs, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
  system.stateVersion = "23.05";
}
