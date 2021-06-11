---
subject: bash
tags:
  - bash
  - scripting
  - short-circuit
snippets:
  - syntax: bash
    content: |-
      return 0 2>/dev/null
  - syntax: bash
    content: |-
      (return 0 2>/dev/null) && sourced=1 || sourced=0
---

# Determine if a script was sourced or executed

Bash only allows `return` in a function or at the top level of a sourced
script. We can call it in a subshell and use the exit code to determine if the
script is being sourced or not.

```bash
(return 0 2>/dev/null) && sourced=1 || sourced=0
```

If all we want to do is to halt execution at some point if we're sourcing the
script, we can use the simpler `return 0 2>/dev/null` as a short-circuit.

```bash
#!/usr/bin/env bash

_a_function() {
  echo "useful stuff"
}

return 0 2>/dev/null

echo "I'll only print when script is executed"
_a_function
```

Example usage:

```bash
source ./script.sh
# _a_function now available for use
_a_function
# useful stuff

. ./script
# I'll only print when script is executed
# useful stuff
```

Source: [stackoverflow][1]

[1]: https://stackoverflow.com/a/28776166
