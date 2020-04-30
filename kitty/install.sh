HERE=$(pwd -P)
CONF_DIR=${HOME}/.config/kitty
THEME_NAME=Darkside
THEME=https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/${THEME_NAME}.conf


mkdir -p ${CONF_DIR}
ln -s ${HERE}/kitty.conf ${CONF_DIR}/

wget "$THEME" -O theme.conf
mv ${HERE}/theme.conf ${CONF_DIR}

