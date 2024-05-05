{
  description = "Filesystem-based module system for Nix";
  inputs = {
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nixpkgs-wayland.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-wayland, ... }:
  let    
    unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
      #nixgl.overlay
      import ./default/overlays/electron.nix
      import ./default/overlays/nchat.nix
      ];
      config = {
        allowUnfree = true;
        allowInsecure = true;
      };
    };
  in
  {
   nixosConfigurations = {
     home = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit system; inherit unstable; };
       modules = [
	        ./default/modules
          ./home/configuration.nix
          ./home/hardware-configuration.nix
          ./home/modules
         ];
     };

     work = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit system; inherit unstable; };
       modules = [
          ./work/configuration.nix
          ./work/hardware-configuration.nix
          ./work/modules
	        ./default/modules
         ];
     };

     mobile = nixpkgs.lib.nixosSystem {
       specialArgs = { inherit system; };
       modules = [
	        ./default/modules
          ./mobile/configuration.nix
	        ./mobile/hardware-configuration.nix
	        ./mobile/modules
        ];
     };
   };
  };
}
