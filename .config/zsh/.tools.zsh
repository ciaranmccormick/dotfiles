
# direnv configuration
eval "$(direnv hook zsh)"

# fzf
source ${ZDOTDIR}/tools/fzf.zsh

# kitty
source <(kitty + complete setup zsh)

# go
export PATH=$PATH:/usr/local/go/bin

# poetry config
export POETRY_HOME=${HOME}/.local/bin/poetry
export PATH="${POETRY_HOME}/bin:$PATH"

# pyenv config
export PYENV_VIRTUALENV_DISABLE_PROMPT=true
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# configurations for rustlang
export PATH="$PATH:$HOME/.cargo/bin"
source "$HOME/.cargo/env"

# configuration for Starship
export STARSHIP_CONFIG=$HOME/.config/starship/config.toml
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# nvm
source ${ZDOTDIR}/tools/nvm.zsh
