mkdir -p $HOME/.config
stow --dir $HOME/dotfiles --target ~/ wm
stow --dir $HOME/dotfiles/os/nixos --target ~/ home-manager
stow --dir $HOME/dotfiles/ etc
nix run home-manager/master -- init --switch
home-manager switch
