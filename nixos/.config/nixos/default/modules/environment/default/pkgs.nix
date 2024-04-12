# environment/default.nix
{pkgs, ...}: let
  unstable = import <nixos-unstable> {config = {allowUnfree = true;};};
in {
  environment.systemPackages = with pkgs; [
    # custom
    #buildtools
    gcc
    gnumake
    appimage-run
    wget
    neovim
    ranger
    git
    ps
    unstable.wezterm
    nodejs
    neofetch
    foot
    zbar
    stow
    home-manager
    networkmanager
    pipewire
    wireplumber
    pavucontrol
    neovim
    ripgrep
    lazygit
    gdu
    bottom
    unstable.rofi-wayland-unwrapped
    waybar
    swaybg
    swaylock-effects
    dunst
    xdg-utils
    imagemagick
    wl-clipboard
    grim
    slurp
    jq
    libnotify
    hyprpicker
    gpick
    pamixer
    openvpn
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    swww
    gnome.adwaita-icon-theme
    eww
    gamescope
    grimblast
    stdenv.cc.cc.lib
    python3
    gtk3
    gobject-introspection
    libnotify
    playerctl
    tlp
    socat
    dig
    libGL
    libglvnd
    vulkan-loader
    vulkan-headers
    glxinfo
    pqiv
    light
    openssl_legacy
    lxc
    ferdium
    xfce.thunar
    nom
    discord
    glxinfo
    pqiv
    light
    logseq
    nvidia-vaapi-driver
    vscodium
    sshpass
    ansible
    libusb
    wdisplays
    firefox
    atool
    unzip
    killall
    wireguard-tools
    gnome.adwaita-icon-theme
    glib
    sshuttle
    libreoffice
    alejandra
    update-resolv-conf
    dropbear
    htop
    zoxide
  ];
  environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.localBinInPath = true;
}
