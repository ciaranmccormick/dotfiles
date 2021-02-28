# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cmccormick/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}~/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "~/.fzf/shell/key-bindings.zsh"


export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
