---
subject: git
tags:
  - git
  - scripting
snippets:
  - syntax: bash
    content: |-
      git rev-parse --show-toplevel
---

# Get the path to the repository root

It's often handy in scripts to get the (absolute) path to the current git repository.

```bash
git rev-parse --show-toplevel
```

Source: `LESS='-p ^\s*--show-toplevel' man git-rev-parse`
