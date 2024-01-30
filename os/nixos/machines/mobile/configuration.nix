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
  programs.streamdeck-ui = {
    enable = true;
    autoStart = true; # optional
  };
  virtualisation.waydroid.enable = true;

}
