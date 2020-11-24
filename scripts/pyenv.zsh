pyi() {
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  local version=$(pyenv install --list | tail -n +2 | fzf-tmux --reverse --multi)

  if [[ ${version} != '' ]]; then
    local version="$(echo -e "${version}" | tr -d '[:space:]')"
    pyenv install ${version}
  fi
  export FZF_DEFAULT_COMMAND=""
  export FZF_DEFAULT_OPTS=""
}

mve() {
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  local version=$(pyenv install --list | tail -n +2 | fzf-tmux --reverse --multi)

  if [[ ${version} != '' ]]; then
    local version="$(echo -e "${version}" | tr -d '[:space:]')"
    echo -e "\n  \033[1mPython version:\033[0m" ${version}
    echo -n "  \033[1mVirtualenv name:\033[0m "
    read name
    if [[ ${name} != '' ]]; then
      echo -n "  Create virtualenv called "${name}" from "${version}" (yes/no)? "
      read confirm
      if [[ ${confirm} == 'yes' ]]; then
        local result=`pyenv virtualenv ${version} ${name} 2>&1`
        local success=$?
        if [[ ${success} != 0 ]]; then
          echo -e "  Version "${version}" not currently installed."
          echo -e "  Installing version "${version}"."
          local result=`pyenv install ${version} 2>&1`
          local installed=$?
          if [[ ${installed} == 0 ]]; then
            echo -e "  Creating virtualenv "${name}" from "${version}"."
            local result=`pyenv virtualenv ${version} ${name} 2>&1`
            if [[ $? != 0 ]]; then 
              echo ${result}
            fi
            echo "  "${name}" created."
          fi
          echo -e "  Unable to install "${version}"."
          echo -e ${result}
        fi
      fi
      echo "  "${name}" created."
    fi
  fi

  export FZF_DEFAULT_COMMAND=""
  export FZF_DEFAULT_OPTS=""
}

dve() {
  export FZF_DEFAULT_OPTS='--height 90% --reverse --border'
  local version=$(pyenv versions | tail -n +2 | grep -v '/' | fzf-tmux --reverse --multi)
  if [[ ${version} != '' ]]; then
    pyenv virtualenv-delete ${version}
  fi
}
