# environment/default.nix
{
  pkgs,
  unstable,
  ...
}: {
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
    networkmanager-openvpn
    pipewire
    wireplumber
    pavucontrol
    neovim
    ripgrep
    lazygit
    gdu
    bottom
    unstable.rofi-wayland
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
    swww
    gnome.adwaita-icon-theme
    eww
    gamescope
    grimblast
    stdenv.cc.cc.lib
    python3
    gtk2 gtk3 gtk4 tela-circle-icon-theme
    transmission_4-gtk
    gthumb
    cmatrix
    lavat
    lolcat
    cava
    helix
    krabby
    zellij
    shellcheck
    obs-studio
    lm_sensors
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
    fzf
    inkscape
    ncdu
    ani-cli
    mpv
    kitty
    libsixel
    trash-cli
    borgbackup
    libsecret
    vlc
    cura
    rpi-imager
    polkit-kde-agent
    remmina
    fuse3
    unstable.nh
    pika-backup
    gimp
    nchat
    cool-retro-term
    kitty
    fx-cast-bridge
    gobject-introspection
    inetutils
    bc
    gnome.zenity
    gradience
    wf-recorder
    lutris
    winetricks
    steam
    bitwarden
    minecraft
    pulseaudio
    prismlauncher-unwrapped
    xclip
    xdotool
    ydotool
    isoimagewriter
    chromium
    speedtest-cli
    sox
    docker
    librecad
    arduino-ide
    kdenlive
    minicom
    gparted
    xorg.xhost
    lxqt.lxqt-policykit
    blobby
    tmux
    postman
    teamviewer
    youtube-music
    qt5.full
    qt6.full
    nix-index
    kdePackages.wayland kdePackages.qtwayland kdePackages.qtsvg
    kdePackages.kio-fuse kdePackages.kio-extras kdePackages.kde-cli-tools
    libsForQt5.qt5.qtquickcontrols libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
    alacritty swaynotificationcenter
    wlogout
    parallel
    udiskie
    polkit_gnome
    libinput-gestures
    cliphist alacritty
    gtklock
    where-is-my-sddm-theme brave
    blueman
    lsd parallel unstable.pwvucontrol
    swappy polkit_gnome libinput-gestures
    kdePackages.qtimageformats
    kdePackages.ffmpegthumbs libnotify
    nwg-look ark
    dolphin kitty eza zsh-powerlevel10k
    envsubst hyprcursor
    gnumake tree
    papirus-icon-theme
    mission-center
    thefuck
    starship
    brave
    gsettings-qt
    qtcreator
    libsForQt5.qt5.qtwayland qt5ct
];

  environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.localBinInPath = true;
}
