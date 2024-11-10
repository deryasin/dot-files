# services/hyprland.nix
{ config, pkgs, unstable, ... }:
{
  programs.hyprland = {
    enable = true;
    package = unstable.hyprland;
    portalPackage = unstable.xdg-desktop-portal-hyprland;
  };
}
