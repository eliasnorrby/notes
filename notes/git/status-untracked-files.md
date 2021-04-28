---
subject: git
tags:
  - git
  - vcs
  - scripting
snippets:
  - syntax: bash
    content: |-
      git status --untracked-files
---

# Listing untracked files with `git status`

When a new directory is added to a git repository, only the directory itself
will be listed as an untracked file in the output from `git status`:

```bash
$ git status --porcelain
 M commit_notes.sh
?? notes/rust/
```

Use the `--untracked-files` (`-u`) flag to list individual untracked files
within the directory:

```bash
$ git status --porcelain -u
 M commit_notes.sh
?? notes/rust/match-operator.md
?? notes/rust/unwrapping.md
```

Source: `man git-status`
