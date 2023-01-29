# Setup fzf
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$ZDOTDIR/plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$ZDOTDIR/plugins/fzf/shell/key-bindings.zsh"

export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
