{
  description = "Filesystem-based module system for Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-wayland, ... }:
  let    
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      #overlays = [nixgl.overlay];
      config = {
        allowUnfree = true;
      };
    };
  in
  {
   nixosConfigurations = {
     home = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit system; };
       modules = [
	 ./default/modules
         ./home/configuration.nix
         ./home/hardware-configuration.nix
         ./home/modules
         ];
     };
     mobile = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit system; };
       modules = [
	 ./default/modules
         ./mobile/configuration.nix
       ];
     };
   };
  };
}
