HERE=$(pwd -P)
PLUGINS=${HERE}/plugins.vim
MAPPINGS=${HERE}/mappings.vim
INIT=${HERE}/init.vim
COC=${HERE}/coc-settings.json
FTPLUGIN=${HERE}/ftplugin

DEST=${HOME}/.config/nvim

mkdir -p ${DEST}
mkdir -p ${FTPLUGIN}

ln -s ${INIT} ${DEST}
ln -s ${MAPPINGS} ${DEST}
ln -s ${PLUGINS} ${DEST}
ln -s ${COC} ${DEST}
ln -s ${FTPLUGIN} ${DEST}

