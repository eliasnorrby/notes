---
subject: bash
tags:
  - bash
  - scripting
snippets:
  - syntax: bash
    content: |-
      DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
---

# Directory of script

It's often useful to know the path of the script being executed, e.g. for
sourcing other files.

```bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
```

This solution works as long as the last component of the path used to find the
script is not a symlink.

Source: [stackoverflow][1]

[1]: https://stackoverflow.com/a/246128
