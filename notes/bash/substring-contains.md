---
subject: bash
snippets:
  - syntax: bash
    content: |
      if [ "${var#*substring}" != "${var}" ]; then
        # do stuff
      fi
  - syntax: bash
    content: |
      [ "${var#*substring}" != "${var}" ]
---

# Bash substring

Does `var` contain 'substring'?

```bash
if [ "${var#*substring}" != "${var}" ]; then
  # do stuff
fi
```

This works by using string substitution: if removing the substring from the
variable results in a string different from the original, we know the latter
contains the former - otherwise, it would remain unchanged.
