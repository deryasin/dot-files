{ config, pkgs, ... }:

{ 
  networking.extraHosts = (builtins.readFile /home/yasin/.hosts);
}
