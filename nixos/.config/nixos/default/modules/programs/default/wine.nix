{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    wine
    # support 64-bit only
    (wine.override { wineBuild = "wine64"; })

    # support 64-bit only
    wine64

    # wine-staging (version with experimental features)
    # winetricks (all versions)
    winetricks

    # native wayland support (unstable)
    wineWowPackages.waylandFull
  ];
}
