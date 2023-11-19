# nix.nix
{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
