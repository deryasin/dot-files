# configuration.nix
{ system, config, pkgs, lib, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
        "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/thinkpad/t14/amd"
#      <home-manager/nixos>
    ];
  environment.systemPackages = with pkgs; [
    pkgs.modemmanager
    pkgs.modem-manager-gui
    pkgs.ani-cli
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal-hyprland];
    wlr.enable = true;
  };
  system.stateVersion = "23.11";
  boot.initrd.kernelModules = [ "amdgpu" ];
nix.settings.trusted-substituters = ["https://ai.cachix.org"];
nix.settings.trusted-public-keys = ["ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="];
}
