{ config, pkgs, home, lib, inputs, ...}: 
{
#imports = [
#  ./flakes/arrpc.nix
#];
#inputs = {
#  arrpc = {
#    url = "github:notashelf/arrpc-flake";
#    inputs.nixpkgs.follows = "nixpkgs";
#  };
#};

 home = {
    username = "yasin";
    homeDirectory = "/home/yasin";
    stateVersion  = "23.05";
  };
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    pkgs.vivaldi
    pkgs.firefox
    pkgs.remmina
    pkgs.gimp
    pkgs.webcord
    pkgs.asciiquarium
    pkgs.chromium
    pkgs.logseq
    pkgs.obs-studio
    pkgs.steam
    (pkgs.discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
    pkgs.wdisplays
    pkgs.wpgtk
    pkgs.youtube-music 
  ];
  programs = {
    home-manager = {
      enable = true;
    };
    
    neovim = {
      plugins = [
        pkgs.vimPlugins.nvim-treesitter
        pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];
    };
  };
}
