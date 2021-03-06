#!/usr/bin/env bash

header_first_row='[alt-]enter: open | ctrl-y: copy snippet | ctrl-r: reload'
header_second_row='ctrl-n: cycle snippets | ctrl-u: commit notes | ctrl-o: open in browser'

file=$(./notes_tool.sh list-with-tags | fzf \
  --ansi \
  --reverse \
  --header "$header_first_row"$'\n'"$header_second_row" \
  --preview './notes_tool.sh preview {1}' \
  --preview-window 'right:81:wrap' \
  --bind 'alt-up:preview-up,alt-down:preview-down' \
  --bind 'ctrl-y:execute-silent(./notes_tool.sh copy {1})+abort' \
  --bind 'ctrl-r:execute-silent(./notes_tool.sh invalidate-cache)+reload(./notes_tool.sh list-with-tags)' \
  --bind 'ctrl-n:execute-silent(./notes_tool.sh next-snippet {1})+refresh-preview' \
  --bind 'ctrl-o:execute-silent(./notes_tool.sh open-in-browser {1})+abort' \
  --bind 'ctrl-p:execute(git push)' \
  --bind 'ctrl-u:execute(./commit_notes.sh prompt >&2)' \
  --bind 'ctrl-f:execute(git pull --no-rebase)' \
  --bind 'alt-enter:print-query' \
  --print-query | tail -1 | cut -d " " -f 1
)

[ -n "$file" ] && ./notes_tool.sh open-or-create "$file"

exit 0
