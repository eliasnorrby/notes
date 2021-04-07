#!/usr/bin/env bash

# Transform a flat hierarchy with prefixed notes:

# notes/
# - css-something-about-margins.md
# - bash-substrin-are-cool.md

# into a directory structure based on prefices:

# notes/
#   css/
#     - something-about-margins.md
#   bash/
#     - substrin-are-cool.md

files=$(find . -type f -name '*.md' | sed -E '/SUMMARY|README|tags|template/d')

for file in $files; do
  dir=${file%%-*}
  name=${file#*-}
  if [ "$1" = "run" ]; then
    [ ! -d "$dir" ] && mkdir "$dir"
    mv "$file" "$dir/$name"
  else
    echo "$file -> $dir/$name"
  fi
done
