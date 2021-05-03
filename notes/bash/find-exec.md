---
subject: bash
tags:
  - bash
  - find
snippets:
  - syntax: bash
    content: |-
      find . -type f -exec cmd {} \;
---

# Using find to run a command on multiple files

Find has an `-exec` action for running a command against found files.

```bash
# create backups of all markdown files
find . -type f -name '*.md' -exec cp {} {}.bak \;
```

The command will be executed for each found file. The construct '{}' will be
replaced by the current file name. The command must be terminated with a
semi-colon that must be escaped to protect it from interpretation by the shell.

## A word of caution

There are both security and performance implications which may be mitigated by
using one of the variations `-exec command {} +`, `-execdir command` or
`-execdir command {} +`.

Source: `man find`
