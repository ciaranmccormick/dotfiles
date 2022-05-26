HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.cache/zsh/history"
ZSH_CACHE="$HOME/.cache/zsh"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.emacs/bin

autoload -Uz compinit 
compinit

source "$ZDOTDIR/.aliases.zsh"
source "$ZDOTDIR/.tools.zsh"
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
