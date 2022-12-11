# judeka's minimal zsh config
# startup programs (remove or add any)
jfetch
date 

# vi mode in terminal
#set -o vi  # for bash
bindkey -v  # for zsh

# prompt and colors
autoload -U colors && colors

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'
alias ip='ip --color=auto'
alias hx='helix'
alias fm='joshuto'
alias ll='ls -l --color=auto'
alias paru='paru --color=auto'
alias pomors='pomors -w 2400 -s 1200 -l 1200'
#alias cat='bat'

PS1="%B$fg[blue]%}[%{$fg[red]%}%?%{$fg[blue]%}] %{$fg[cyan]%}%~%F{91} λ%{$reset_color%}%f%b "

# history
HISTSIZE=99
SAVEHIST=99
HISTFILE=~/.cache/zsh/history

# sourcing
export PATH="$PATH:$HOME/Programs/flutter/bin:$HOME/.cargo/bin:$HOME/.local/bin"

# load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

