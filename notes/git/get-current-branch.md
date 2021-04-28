---
subject: git
snippets:
  - syntax: bash
    content: |
      git branch --show-current
  - syntax: bash
    content: |
      git rev-parse --abbrev-ref HEAD
---

# Name of current branch

To get the name of the current branch, we can use `git rev-parse`:

```bash
$ git rev-parse --abbrev-ref HEAD
```

This will print the name of the current branch _as long as we have one checked
out_. If we're in a detached HEAD state, it will print HEAD.

Since version 2.22, `git branch` has a `--show-current` option. It will give us
the name of the current branch, but intead will print nothing if we're in a
detached HEAD state.

```bash
$ git branch --show-current
```

Source: `man git-rev-parse`, `man git-branc`
