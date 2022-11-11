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
alias gpl='git pull'
alias gplum='git pull upstream $(git_main_branch)'
alias gplr='git pull --rebase'
alias gplv='git pull --rebase -v'

# git push
alias gpu='git push'
alias gpf='git push --force-with-lease'
alias gpoc='git push origin $(git_current_branch)'
alias gpof='git push origin $(git_current_branch) --force-with-lease'

# git rebase
alias grb='git rebase'
alias grbd='git rebase $(git_develop_branch)'

# git restore
alias gre='git restore'
alias gres='git restore --staged'

# git status
alias gst='git status'

# git switch
alias gsw
alias gswd='git switch $(git_develop_branch)'
