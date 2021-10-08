if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.cache/zsh/history
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/alberto/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Default programs
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export PATH=$HOME/.local/bin:$PATH

alias hibernate="systemctl hibernate"
alias n="nnn -d"
alias \
    ll="exa --icons" \
    la="exa --icons -la"

# Verbosity
alias \
    cp="cp -iv" \
    mv="mv -iv" \
    rm="rm -vI" \
    mkdir="mkdir -pv"

# Colorize commands when possible.
alias \
    ls="ls -hN --color=auto --group-directories-first" \
    grep="grep --color=auto" \
    diff="diff --color=auto" \

source ~/.powerlevel10k/powerlevel10k.zsh-theme

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
