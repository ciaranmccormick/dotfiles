#!/usr/bin/env zsh
#
# A good old bash | curl script for bat.
#
set -euo pipefail

{ # Prevent execution if this script was only partially downloaded

  app_name=bat

  log() {
    echo "[installer] $*" >&2
  }

  die() {
    log "$@"
    exit 1
  }

  at_exit() {
    ret=$?
    if [[ $ret -gt 0 ]]; then
      log "the script failed with error $ret.\n"
    fi
    exit "$ret"
  }
  trap at_exit EXIT

  kernel=$(uname -s | tr "[:upper:]" "[:lower:]")
  case "${kernel}" in
    mingw*)
      kernel=windows
      ;;
    linux)
      kernel=linux-gnu
      ;;
  esac
  case "$(uname -m)" in
    x86_64)
      machine=x86_64-unknown
      ;;
    i686 | i386)
      machine=386
      ;;
    aarch64 | arm64)
      machine=arm64
      ;;
    *)
      die "Machine $(uname -m) not supported by the installer.\n"
      ;;
  esac
  log "kernel=$kernel machine=$machine"

  : "${use_sudo:=}"
  bin_path=~/.local/bin
  echo "bin_path=$bin_path"

  if [[ -n "${version:-}" ]]; then
    release="tags/${version}"
  else
    release="latest"
  fi
  echo "release=$release"
  echo "grep=${app_name}-.*${machine}-${kernel}.tar.gz"

  log "looking for a download URL"
  download_url=$(
    curl -fL "https://api.github.com/repos/sharkdp/bat/releases/$release" \
    | grep browser_download_url \
    | cut -d '"' -f 4 \
    | grep "${app_name}-.*-${machine}-${kernel}.tar.gz"
  )
  echo "download_url=$download_url"

  log "downloading"
  curl -o "/tmp/${app_name}.tar.gz" -fL "$download_url"
  log "extracting"
  tar -xvf "/tmp/${app_name}.tar.gz" -C ${bin_path} ${app_name}
  log "changing mode"
  chmod a+x "$bin_path/${app_name}"

  cat <<DONE

The fzf binary is now available in:

    $bin_path/${app_name}

Thanks!
DONE
}
