# services/dconf.nix
{ config, ...}:
{
  programs.dconf = {
    enable = true; # Fix for Wezterm not displaying mouse
  };
}
