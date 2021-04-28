---
subject: vim
syntax: bash
tags:
  - vim
snippets:
  - syntax: bash
    content: |-
      vim -o *.sh
---

# Opening a list of files in split windows

To open a list of files in split windows, we can use the `-o` and `-O` flags:

```bash
# Opens files in horizontal splits
vim -o file1 file2 file3

# The same, but with vertical splits
vim -O file1 file2 file3
```

Likewise, the `-n` flag can be used to open files in a tab each.

See `:help -o` for more information.
