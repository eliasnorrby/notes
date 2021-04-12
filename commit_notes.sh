#!/usr/bin/env bash

EXT=md

commit() {
  local note=$1
  local op=$2
  short_name="${note##notes/}"
  short_name="${short_name%%.${EXT}}"
  short_name=${short_name/\// }
  subject=${short_name%% *}
  message=${short_name#* }
  git add "$note"
  git commit -m "note($subject): $op $message"
}

new_notes=$(git status --porcelain --untracked-files | grep '^?? notes/' | cut -d ' ' -f 2)
modified_notes=$(git status --porcelain | grep '^ M notes/' | cut -d ' ' -f 3)

for note in $new_notes; do
  commit "$note" "add"
done

for note in $modified_notes; do
  commit "$note" "update"
done
