#!/usr/bin/env zsh
#
# A good old bash | curl script for fzf.
#
set -euo pipefail

{ # Prevent execution if this script was only partially downloaded

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
  esac
  case "$(uname -m)" in
    x86_64)
      machine=amd64
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

  log "looking for a download URL"
  download_url=$(
    curl -fL "https://api.github.com/repos/junegunn/fzf/releases/$release" \
    | grep browser_download_url \
    | cut -d '"' -f 4 \
    | grep "fzf-.*-${kernel}_${machine}"
  )
  echo "download_url=$download_url"

  log "downloading"
  curl -o "/tmp/fzf.tar.gz" -fL "$download_url"
  log "extracting"
  tar -xvf "/tmp/fzf.tar.gz" -C ${bin_path} fzf
  log "changing mode"
  chmod a+x "$bin_path/fzf"

  cat <<DONE

The fzf binary is now available in:

    $bin_path/fzf

Thanks!
DONE
}
