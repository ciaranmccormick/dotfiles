#!/usr/bin/env bash

# curl cht.sh/{language}/query+string
# curl cht.sh/{core-util}~{operation}
languages=`echo "python lua typescript rust" | tr ' ' '\n'`
core_utils=`echo "printf xargs find mv sed awk" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p 'query: ' query

if echo $languages | grep -qs $selected; then
  tmux neww -c bash "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
  tmux neww -c bash "curl cht.sh/$selected~`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
fi
