# pyenv config
export PYENV_VIRTUALENV_DISABLE_PROMPT=true
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init -)"
