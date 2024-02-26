# nix.nix
{ config, lib, pkgs, ... }:
{
  nixpkgs = {
    config= {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-20.3.12"
      ];
    };
  };
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
      "experimental-features = nix-command flakes";
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
}
