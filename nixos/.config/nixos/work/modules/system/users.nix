# users.nix
{ config, lib, pkgs, ... }:

{
  users.users.yasin = {
    isNormalUser = true;
    home = "/home/yasin";
    extraGroups = [ "wheel" "networkmanager" "dialout" "lp" "tty" "input"];
  };
  users.defaultUserShell = pkgs.zsh;
  #programs.home-manager.enable = true;
}

