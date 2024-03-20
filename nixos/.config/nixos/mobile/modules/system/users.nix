# users.nix
{ config, lib, pkgs, ... }:

{
  users.users.yasin = {
    isNormalUser = true;
    home = "/home/yasin";
    extraGroups = [ "wheel" "networkmanager" "video"];
  };
  users.defaultUserShell = pkgs.zsh;
}

