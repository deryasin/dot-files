# configuration.nix
{ predefinedVariables, config, pkgs, lib, unstable, ... }:
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
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    wlr.enable = true;
  };
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  system.stateVersion = predefinedVariables.stateVersion;
}
