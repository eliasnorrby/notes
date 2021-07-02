---
subject: bash
tags:
  - bash
snippets:
  - syntax: bash
    content: |-
      less -S
---

# Parsing output with long lines using less

Output from commands that generate very long lines (e.g. tables produced by
`docker` or `kubectl`) can be hard to parse when lines are wrapped. We can pipe
their output to `less` using the `-S` or `--chop-long-lines` flag to have the
lines be truncated instead of wrapped. The arrow keys can be used to view parts
of lines that don't fit on the screen.

```bash
kubectl get pods -o wide | less -S
```

Source: `man less`
