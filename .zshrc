# starship prompt
eval "$(starship init zsh)"

# zsh autocomplete
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

# Alias
alias ls='ls --color=auto'
alias hibernate="systemctl hibernate"

# Variables
export EDITOR="/usr/bin/vim"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
