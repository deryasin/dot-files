{ config, ...}:
{
  services = {
    gnome3 = {
      gnome-keyring.enable = true;
      seahorse.enable = true;
      at-spi2-core.enable = true;
    };
  };
}
