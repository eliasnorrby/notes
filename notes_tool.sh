#!/usr/bin/env bash

NOTES_DIR=~/notes/notes
TEMPLATE_FILE="${NOTES_DIR}/note-template.md"
EXT=md

list() {
  find . -type f -name "*.${EXT}" | sed -e 's#^\./##' -e 's#\.'"${EXT}"'$##'
}

read_frontmatter() {
  sed -n '/---/,/---/ { /---/d; p; }' "$1"
}

print_docs() {
  sed '/---/,/---/d' "$1" | mdcat
}

has_snippet() {
  test "$(read_frontmatter "$1" | yq eval 'has("snippet")' -)" = 'true'
}

read_snippet() {
  read_frontmatter "$1" | yq eval '.snippet' -
}

print_snippet() {
  local syntax
  echo "> Copy this snippet: "
  echo
  syntax=$(sed -n '/---/,/---/ { /---/d; p; }' "$1" | yq eval '.syntax' -)
  read_snippet "$1" | bat -l "$syntax" --color always
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
  if has_snippet "$1"; then
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
  if ! has_snippet "$1"; then
    return
  fi
  read_snippet "$1" | copy_cmd
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
  preview)
    preview "$(_ext "$2")"
    ;;
  copy)
    copy_snippet "$(_ext "$2")"
    ;;
  open-or-create)
    open_or_create "$(_ext "$2")"
    ;;
esac
