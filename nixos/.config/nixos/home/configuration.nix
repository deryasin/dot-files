# configuration.nix
{ system, config, pkgs, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
  environment.systemPackages = with pkgs; [
    pkgs.ani-cli
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
    wlr.enable = true;
  };
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  system.stateVersion = "23.05";
}
