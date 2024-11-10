mkdir -p $HOME/.config
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share

stow --dir $HOME/dotfiles --target ~/ wm
stow --dir $HOME/dotfiles/ --target ~/ etc
stow --dir $HOME/dotfiles/ --target ~/ nvim
stow --dir $HOME/dotfiles/ --target ~/ shell

## Hyde-cli installation
if [ ! -f $HOME/.local/bin/Hyde ]; then
	echo "Setup Hyde-cli..."
	git clone https://github.com/kRHYME7/Hyde-cli.git /tmp/Hyde-cli
	cd /tmp/Hyde-cli
	sed -i "s|/bin/env|/usr/bin/env|" {Hyde,Hyde-install,Hyde-tool}
	make LOCAL=1
	rm -rf "/tmp/Hyde-cli"
	cd - >/dev/null 2>&1
fi

# Hyprdots installation
if [ ! -d $HOME/hyprdots ]; then
	echo "-----------------------------------"
	echo "Cloning hyprdots..."
	git clone https://github.com/prasanthrangan/hyprdots.git --depth=1 ~/hyprdots || echo "FATAL ERROR: Git closed" && exit
	cd ~/hyprdots/Scripts || echo "FATAL ERROR: Could not cd into ~/hyprdots/Scripts" && exit
	sed -i '/continue\ 2/d' ~/hyprdots/Scripts/restore_cfg.sh

	# Hyde Theme Setup
	Hyde-install --dir ~/hyprdots --link
fi

#Pokemon installation
if [ ! -f $HOME/.local/bin/pokemon-colorscripts ]; then
	echo "Setup Pokemon..."
	git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git /tmp/pokemon-colorscripts
	cd /tmp/pokemon-colorscripts
	sed -i 's|INSTALL_DIR='\''/usr/local/opt'\''|INSTALL_DIR="$HOME/.local/opt"|' install.sh
	sed -i 's|BIN_DIR='\''/usr/local/bin'\''|BIN_DIR="$HOME/.local/bin"|' install.sh
	/usr/bin/env bash install.sh
	cd - >/dev/null 2>&1
	rm -rf "/tmp/pokemon-colorscripts"
fi
