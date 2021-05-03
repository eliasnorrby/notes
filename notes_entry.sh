#!/usr/bin/env bash

header_first_row='[alt-]enter: open | ctrl-y: copy snippet | ctrl-r: reload'
header_second_row='ctrl-n: cycle snippets | ctrl-k: commit notes'

file=$(./notes_tool.sh list-with-tags | fzf \
  --ansi \
  --reverse \
  --header "$header_first_row"$'\n'"$header_second_row" \
  --preview './notes_tool.sh preview {1}' \
  --preview-window 'right:80:wrap' \
  --bind 'alt-up:preview-up,alt-down:preview-down' \
  --bind 'ctrl-y:execute-silent(./notes_tool.sh copy {1})+abort' \
  --bind 'ctrl-r:execute-silent(./notes_tool.sh invalidate-cache)+reload(./notes_tool.sh list-with-tags)' \
  --bind 'ctrl-n:execute-silent(./notes_tool.sh next-snippet {1})+refresh-preview' \
  --bind 'ctrl-k:execute(./commit_notes.sh prompt >&2)+abort' \
  --bind 'alt-enter:print-query' \
  --print-query | tail -1 | cut -d " " -f 1
)

[ -n "$file" ] && ./notes_tool.sh open-or-create "$file"

exit 0
