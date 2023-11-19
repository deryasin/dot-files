{
  pkgs,
  lib,
  inputs,
  ...
}:
with lib; {
  imports = [
    inputs.arrpc.homeManagerModules.default
  ];

  config =  {
    home.packages = [
      pkgs.webcord-vencord # webcord with vencord extension installed
    ];
    # enable arRPC service, adds arRPC to home-packages and starts the systemd service for you
    services.arrpc.enable = true;
  };
}

