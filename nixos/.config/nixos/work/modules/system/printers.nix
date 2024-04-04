{ config, lib, pkgs, ... }:
{
services.printing.enable = true;

services.avahi = {
  enable = true;
  nssmdns = true;
  openFirewall = true;
};

services.printing.drivers = [ pkgs.mfcl8690cdwlpr ];

}
