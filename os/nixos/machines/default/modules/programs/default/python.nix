{ pkgs, ... }:
{
environment.systemPackages = with pkgs; [
   (python3.withPackages(ps: with ps; [ pygobject3 gst-python dbus-python ]))
  ];
}

