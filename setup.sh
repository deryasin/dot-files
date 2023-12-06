mkdir -p /home/yasin/.config
stow --dir /home/yasin/dotfiles --target ~/ wm
stow --dir /home/yasin/dotfiles/os/nixos --target ~/ home-manager
stow --dir /home/yasin/dotfiles/ etc
nix run home-manager/master -- init --switch
home-manager switch
