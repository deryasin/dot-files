# services/hyprland.nix
{ config, ... }:
{
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };
}
