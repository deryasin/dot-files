{
  description = "Filesystem-based module system for Nix";
  inputs = {
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    hyprwm-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
};

  outputs = inputs @ { self, nixpkgs, zen-browser, ... }:
  let
    predefinedVariables = (import ./variables.nix);
    unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
    pkgs = import nixpkgs {
      overlays = [
        (import ./default/overlays/electron.nix)
        (import ./default/overlays/eww.nix)
        (self: super: { lutris = super.lutris.override { extraLibraries = pkgs: [pkgs.libunwind ]; }; })
      ];
      config = {
        allowUnfree = true;
        allowInsecure = true;
      };
    };
  in
  

  {
   nixosConfigurations = {
     home = nixpkgs.lib.nixosSystem rec { # https://nix.dev/manual/nix/2.17/language/constructs
       specialArgs = { inherit predefinedVariables; inherit pkgs; inherit unstable; };
       modules = [
          ./default/pkgs
	        ./default/modules
          ./home/configuration.nix
          ./home/hardware-configuration.nix
          ./home/modules
         ];
     };

     work = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit predefinedVariables; inherit pkgs; inherit unstable; };
       modules = [
          ./work/configuration.nix
          ./work/hardware-configuration.nix
          ./work/modules
	        ./default/modules
         ];
     };
   };
  };
}

