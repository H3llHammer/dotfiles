if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History in cache history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

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

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source ~/.powerlevel10k/powerlevel10k.zsh-theme

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
