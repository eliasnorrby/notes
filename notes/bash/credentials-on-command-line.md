---
subject: bash
tags:
  - bash
  - secret
snippets:
  - syntax: bash
    content: |-
      read -p "SECRET: " -s mysecret
---

# Hiding credentials on the command line

Some commands require sensitive information to be passed on the command line.
If we don't want these to show up in the command history, we can use `read`
with the `-s` flag to store secret values in variables:

```bash
read -p "PASSWORD: " -s mypass
cmd login --creds user:${mypass}
```
