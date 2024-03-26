export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.config/nvim/bin/
export PATH=$PATH:~/.local/bin/
export GTK_THEME=Adwaita:dark
export EDITOR=vim

if [[ "$(hostname)" == "home" ]]; then
    ZSH_THEME="home-default"
elif [[ "$(hostname)" == "work" ]]; then
    ZSH_THEME="work-default"
elif [[ "$(hostname)" == "mobile" ]]; then 
    ZSH_THEME="mobile-default"
else
    ZSH_THEME="home-default"
fi

PS1='%n@%m %~ %# '
plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

alias sranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias vim="nvim"
