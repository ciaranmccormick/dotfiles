alias zsrc='source $HOME/.config/zsh/.zshrc'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# exa
alias ls='exa'
alias ll='exa -alh'
alias tree='exa --tree'

# bat
alias cat='bat'

# lazygit
alias lg='lazygit'

# zoxide
alias cd='z'
alias zz='z -'

for file in $ZDOTDIR/aliases/*.zsh; do
    source "$file"
done

alias upgrade='sudo apt update; sudo apt upgrade -y'

# git aliases
alias gsw='git switch'
alias gpu='git pull'
alias grs='git restore'
