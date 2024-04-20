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
setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.
HIST_STAMPS="yyyy-mm-dd"
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

alias sranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias rm="trash --verbose"
alias vim="nvim"

eval "$(zoxide init --cmd cd zsh)"
