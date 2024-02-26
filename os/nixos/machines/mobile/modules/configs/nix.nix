# nix.nix
{ config, lib, pkgs, ... }:
{
  nix = {
    nixPath = [
      "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
      "nixos-config=/home/yasin/dotfiles/os/nixos/machines/mobile/configuration.nix"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];
  };
}
