#!/usr/bin/env bash

file=$(./notes_tool.sh list-with-tags | fzf \
  --ansi \
  --reverse \
  --header '[alt-]enter: open | ctrl-y: copy snippet' \
  --preview './notes_tool.sh preview {1}' \
  --preview-window 'right:80:wrap' \
  --bind 'alt-up:preview-up,alt-down:preview-down' \
  --bind 'ctrl-y:execute-silent(./notes_tool.sh copy {1})+abort' \
  --bind 'ctrl-n:execute-silent(./notes_tool.sh next-snippet {1})+refresh-preview' \
  --bind 'alt-enter:print-query' \
  --print-query | tail -1 | cut -d " " -f 1
)

[ -n "$file" ] && ./notes_tool.sh open-or-create "$file"

exit 0
