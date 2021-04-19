#!/usr/bin/env bash

# Build a SUMMARY.md from existing notes

NOTES_DIR=notes

cd "$NOTES_DIR" || exit

subject_sections() {
  local files subjects
  subjects=$(find . -type d | remove_leading_dot | grep -v '^\.' | sort)

  for subject in $subjects; do
    echo "## $subject"
    echo
    note_links "$subject"
    echo
  done
}

remove_leading_dot() {
  sed 's#\./##'
}

note_links() {
  local files title
  files=$(find "$1" -type f -name '*.md' | remove_leading_dot | sort)

  for file in $files; do
    title=$(get_title "$file")
    echo "* [$title]($file)"
  done
}

get_title() {
  grep "^# " -m1 < "$1" | sed 's/^# //'
}

read -r -d "" SUMMARY <<EOF
# Summary

$(subject_sections)
EOF

echo "$SUMMARY"
