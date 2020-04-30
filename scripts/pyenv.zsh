
pyi() {
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  version=$(pyenv install --list | tail -n +2 | fzf-tmux --reverse --multi)

  if [[ ${version} != '' ]]; then
    version="$(echo -e "${version}" | tr -d '[:space:]')"
    pyenv install ${version}
  fi
  export FZF_DEFAULT_COMMAND=""
  export FZF_DEFAULT_OPTS=""
}
