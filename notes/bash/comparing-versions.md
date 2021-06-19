---
subject: bash
tags:
  - bash
  - version
snippets:
  - syntax: bash
    content: |-
      version_less_than() {
        printf '%s\n%s' "$1" "$2" | sort --version-sort --check
      }

      version_greater_than() {
        ! version_less_than "$1" "$2"
      }
---

# Comparing versions

Here's a couple of functions for comparing versions.

```bash
version_less_than() {
  printf '%s\n%s' "$1" "$2" | sort --version-sort --check
}

version_greater_than() {
  ! version_less_than "$1" "$2"
}
```

- `--version-sort` (shorthand `-V`) sorts based on version numbers.
- `--check` (shorthand `-C`) make `sort` check for sorted input instead of sorting.

Example usage:

```bash
MY_VERSION=1.2.3
if version_less_than "$MY_VERSION" 4.3.0; then
  : # do something
fi
```

Source: `man sort`
