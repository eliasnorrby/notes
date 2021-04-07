#!/usr/bin/env bash

# Transform a directory structure based on prefices:

# notes/
#   css/
#     - something-about-margins.md
#   bash/
#     - substrin-are-cool.md

# into a flat hierarchy with prefixed notes:

# notes/
# - css-something-about-margins.md
# - bash-substrin-are-cool.md

files=$(find . -type f -name '*.md' | sed -e '\#\./[^/]*$#d' -e 's#\./##')

for file in $files; do
  dir=${file%%/*}
  name=${file#*/}
  if [ "$1" = "run" ]; then
    mv "$file" "${dir}-${name}"
  else
    echo "$file -> ${dir}-${name}"
  fi
done
