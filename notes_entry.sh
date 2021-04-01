#!/usr/bin/env bash

file=$(./notes_tool.sh list | fzf \
  --preview './notes_tool.sh preview {}' \
  --preview-window 'right:60%:wrap' \
  --bind 'alt-up:preview-up,alt-down:preview-down' \
  --bind 'ctrl-f:execute(./notes_tool.sh copy {})' \
  --bind 'alt-enter:print-query' \
  --print-query | tail -1
)

[ -n "$file" ] && ./notes_tool.sh open-or-create "$file"

exit 0
