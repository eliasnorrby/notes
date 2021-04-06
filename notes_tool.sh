#!/usr/bin/env bash

NOTES_DIR=${NOTES_DIR:-~/notes/notes}
TEMPLATE_FILE="${NOTES_DIR}/note-template.md"
EXT=md

CACHE_DIR=${XDG_CACHE_HOME:-~/.cache}/notes
NOTES_DIR_STAT_FILE=${CACHE_DIR}/notes_dir_stat
LIST_WITH_TAGS_CACHE=${CACHE_DIR}/list_with_tags
NOTES_SNIPPET_IDX_DIR=${CACHE_DIR}/snippet_idx
LAST_DOCS_PRINTED=${CACHE_DIR}/last_docs_printed

if [ ! -d "$NOTES_SNIPPET_IDX_DIR" ]; then
  mkdir -p "$NOTES_SNIPPET_IDX_DIR"
fi

# colors
DARK_GRAY=$(tput setaf 8)
NC=$(tput sgr 0) # No Color

list() {
  find . -type f -name "*.${EXT}"  | sed -e 's#^\./##' -e 's#\.'"${EXT}"'$##'
}

cache_is_valid() {
  [ -e "$NOTES_DIR_STAT_FILE" ] && [ "$(stat -t "$NOTES_DIR")" = "$(<"$NOTES_DIR_STAT_FILE")" ]
}

list_with_tags() {
  if cache_is_valid; then
    cat "$LIST_WITH_TAGS_CACHE"
    return
  fi

  stat -t "$NOTES_DIR" > "$NOTES_DIR_STAT_FILE"
  list | append_tags | tee "$LIST_WITH_TAGS_CACHE"
}

append_tags() {
  while read -r file; do
    printf '%s' "$file"
    if has_key "$file" 'tags'; then
      local tags
      tags=$(read_key "$file" 'tags' | tr -d '-' | tr -d '\n')
      printf '%s' "${DARK_GRAY}$tags${NC}"
    fi
    echo
  done
}

frontmatter_boundary() {
  awk '/^---$/ && (++c == 2) { print NR; exit }' "$1"
}

read_frontmatter() {
  [ -n "$1" ] && awk '/^---$/{if (flag == 0) {flag = 1;next} else {exit}}flag' "$(_ext "$1")"
}

print_docs() {
  local boundary
  if [ -f "$LAST_DOCS_PRINTED" ]; then
    echo "$(<"$LAST_DOCS_PRINTED")"
    rm "$LAST_DOCS_PRINTED"
    return
  fi
  boundary=$(frontmatter_boundary "$1")
  boundary=$((boundary+1))
  sed -n "${boundary},$ p" "$1" | mdcat
}

has_key() {
  test "$(read_frontmatter "$1" | yq eval "has(\"${2}\")" -)" = 'true'
}

read_key() {
  read_frontmatter "$1" | yq eval ".${2}" -
}

read_snippet_idx() {
  local idx_file="$NOTES_SNIPPET_IDX_DIR/$1"
  if [ -f "$idx_file" ]; then
    cat "$idx_file"
  else
    echo 0
  fi
}

write_snippet_idx() {
  local idx_file="$NOTES_SNIPPET_IDX_DIR/$1"
  echo "$2" > "$idx_file"
}

get_snippet_count() {
  read_frontmatter "$1" | yq eval ".snippets | length" -
}

next_snippet() {
  local idx next_idx count
  count="$(get_snippet_count "$1")"
  if [ "$count" = 1 ]; then
    return
  fi

  idx=$(read_snippet_idx "$1")
  next_idx=$((idx + 1))
  if [ "$idx" -eq "$((count - 1))" ]; then
    next_idx=0
  else
    next_idx=$((idx + 1))
  fi

  write_snippet_idx "$1" "$next_idx"
  print_docs "$1" > "$LAST_DOCS_PRINTED.tmp"
  mv "$LAST_DOCS_PRINTED.tmp" "$LAST_DOCS_PRINTED"
}

print_snippet() {
  local syntax idx count
  local message="> Copy this snippet: "
  count="$(get_snippet_count "$1")"
  if [ "$count" -eq 1 ]; then
    idx=0
  else
    idx=$(read_snippet_idx "$1")
    message="$message ($((idx + 1))/$count)"
  fi

  echo "$message"
  echo

  syntax=$(read_key "$1" "snippets[$idx].syntax")
  read_key "$1" "snippets[$idx].content" | bat -l "$syntax" --color always
}

divider() {
  local v
  columns=$((FZF_PREVIEW_COLUMNS + 2))
  v=$(printf "%-${columns}s" "─")
  echo "${v// /─}"
}

divider_oneline() {
  printf '%0.s─' $(seq 1 "$FZF_PREVIEW_COLUMNS")
  echo
}

preview() {
  if has_key "$1" 'snippets'; then
    print_snippet "$1"
    divider_oneline
  fi

  print_docs "$1"
}

_os() {
  case $OSTYPE in
    linux*) if   [[ -f /etc/arch-release   ]]; then echo -n arch
            elif [[ -f /etc/debian_version ]]; then echo -n debian
            fi ;;
    darwin*) echo -n macos ;;
    cygwin*) echo -n cygwin ;;
  esac
}

if [ "$(_os)" = "macos" ]; then
  copy_cmd () {
    pbcopy
  }
else
  copy_cmd () {
    xclip -selection clipboard
  }
fi

copy_snippet() {
  if ! has_key "$1" 'snippets'; then
    return
  fi

  idx=$(read_snippet_idx "$1")
  read_key "$1" "snippets[$idx].content" | copy_cmd
}

editor_is_vim() {
  [ "$EDITOR" = "vim" ] || [ "$EDITOR" = "nvim" ]
}

create_from_template() {
  local filename="$1"
  if [ "${filename#* }" != "${filename}" ]; then
    # Who would put spaces in a filname?
    exit 1
  fi
  cp "$TEMPLATE_FILE" "$filename"
}

_ext() {
  if [ "${1%.$EXT}" == "${1}" ]; then
    echo -n "$1.${EXT}"
  else
    echo -n "$1"
  fi
}

open_or_create() {
  local filename="$1"
  if ! [ -f "$filename" ]; then
    create_from_template "$filename"
  fi

  "$EDITOR" "$filename"
}

cd "$NOTES_DIR" || exit

case $1 in
  list)
    list
    ;;
  list-with-tags)
    list_with_tags
    ;;
  preview)
    preview "$(_ext "$2")"
    ;;
  next-snippet)
    next_snippet "$(_ext "$2")"
    ;;
  copy)
    copy_snippet "$(_ext "$2")"
    ;;
  open-or-create)
    open_or_create "$(_ext "$2")"
    ;;
esac
