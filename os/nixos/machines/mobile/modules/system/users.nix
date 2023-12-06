# users.nix
{ config, lib, pkgs, ... }:

{
  users.users.yasin = {
    isNormalUser = true;
    home = "/home/yasin";
    extraGroups = [ "wheel" "networkmanager" ];
  };
  users.defaultUserShell = pkgs.zsh;
}

