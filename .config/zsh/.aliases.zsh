alias nzsh='source $HOME/.config/zsh/.zshrc'

# exa
alias ls='exa'
alias ll='exa -alh'
alias tree='exa --tree'

# bat
alias cat='batcat'

# zoxide
alias cd='z'
alias zz='z -'

for file in $ZDOTDIR/aliases/*.zsh; do
    source "$file"
done
