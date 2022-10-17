source ~/.config/zsh/tools/git.func.zsh

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# git branch
alias gbthis='git branch --show-current'

# git checkout
alias gcob='git checkout -b'

# git fetch
alias gfo='git fetch origin'
alias gfod='git fetch origin $(git_develop_branch)'

# git pull
alias glum='git pull upstream $(git_main_branch)'
alias gup='git pull --rebase'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias gupv='git pull --rebase -v'

# git push
alias gpf='git push --force-with-lease'
alias gpoc='git push origin $(git_current_branch)'
alias gpof='git push origin $(git_current_branch) --force-with-lease'

# git rebase
alias grbd='git rebase $(git_develop_branch)'

alias gres='git restore --staged'
alias gre='git restore'

alias gst='git status'
alias gswd='git switch $(git_develop_branch)'
