# boot/extra.nix
{
  boot.initrd.luks.devices = {
    crypted = {
      device = "/dev/disk/by-uuid/3457d6e8-b3df-414a-9199-1ef06827f03c";
      preLVM = true;
      allowDiscards = true;
  };
}
