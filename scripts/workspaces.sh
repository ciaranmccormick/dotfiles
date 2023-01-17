#!/usr/bin/env bash

if [ -d "$HOME/code" ]
then
  code_dir="${HOME}/code/"
else
  code_dir="${HOME}/Code/"
fi

selected=`ls $code_dir | fzf`
echo "$code_dir$selected"
tmux neww -c "$code_dir$selected" -n $selected
